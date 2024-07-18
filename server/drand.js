import axios from "axios";

const chainHash =
  "52db9ba70e0cc0f6eaf7803dd07447a1f5477735fd3f661792ba94600c84e971";
const DRAND_URL = `https://api.drand.sh/${chainHash}/public/latest`;

export async function fetchDrandValue() {
  try {
    const response = await axios.get(DRAND_URL);
    return response.data;
  } catch (error) {
    console.error("Error fetching Drand value:", error);
    return null;
  }
}
