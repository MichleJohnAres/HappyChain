import { createPublicClient, createWalletClient, http, keccak256 } from "viem";
import { privateKeyToAccount } from "viem/accounts";
import { sepolia } from "viem/chains";

import { fetchDrandValue } from "./drand.js";
import { ContractConfig } from "./drandOracleAbi.js";
// import { sendTransaction } from "./transactionManager.js";

const account = privateKeyToAccount("your_wallet_private_key");

const walletClient = createWalletClient({
  account,
  chain: sepolia,
  transport: http(
    "https://eth-sepolia.g.alchemy.com/v2/MTz0qZk1TPU2ZbPlfhcMaNNq1kNKsZcy"
  ),
});
const BrandGenesisTimestamp = 1692803367;

async function monitorDrand() {
  let timestamp, data, round, randomness;
  data = await fetchDrandValue();
  round = data.round;
  randomness = data.randomness.slice(0, 32);
  timestamp = (round - 1) * 3 + BrandGenesisTimestamp;
  console.log(timestamp, " ", randomness);
  let hash = await walletClient.writeContract({
    ...ContractConfig,
    functionName: "updateDrand",
    args: [timestamp, randomness],
    gas: 169420n,
  });
  console.log("write hash:", hash);
}

setInterval(monitorDrand, 3000);
