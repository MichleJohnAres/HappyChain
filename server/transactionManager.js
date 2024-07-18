import { createPublicClient, http } from "viem";
import { createWalletClient, custom } from "viem";
import { privateKeyToAccount } from "viem/accounts";
import { sepolia } from "viem/chains";

const publicClient = createPublicClient({
  chain: sepolia,
  transport: http(
    "https://eth-sepolia.g.alchemy.com/v2/MTz0qZk1TPU2ZbPlfhcMaNNq1kNKsZcy"
  ),
});

const account = privateKeyToAccount("your_wallet_private_key");

const walletClient = createWalletClient({
  account,
  chain: sepolia,
  transport: http(
    "https://eth-sepolia.g.alchemy.com/v2/MTz0qZk1TPU2ZbPlfhcMaNNq1kNKsZcy"
  ),
});

async function sendTransaction(tx) {
  try {
    const { hash } = await walletClient.sendTransaction(tx);
    await publicClient.waitForTransactionReceipt({ hash });
    return hash;
  } catch (error) {
    console.error("Transaction failed, retrying:", error);
    // Retry logic
    return sendTransaction(tx);
  }
}

export { sendTransaction };
