import Foundation

public struct LC1749 {
    class Solution {
        
        func maxAbsoluteSum(_ nums: [Int]) -> Int {
            // Compute the maximum subarray sum for both the original and negated arrays.
            let maxPositiveSubarraySum = calculateMaxSubarraySum(nums)
            let maxNegativeSubarraySum = calculateMaxSubarraySum(negateArray(nums))
            
            // Return the larger of the two sums as the maximum absolute sum.
            return max(maxPositiveSubarraySum, maxNegativeSubarraySum)
        }
        
        // MARK: - Private methods
        
        private func calculateMaxSubarraySum(_ numbers: [Int]) -> Int {
            var currentMaxSum = 0
            var globalMaxSum = 0
            
            for number in numbers {
                // Update the current running sum to include the current number or start fresh from the current number.
                currentMaxSum = max(currentMaxSum + number, number)
                
                // Update the global maximum sum if the current running sum is greater.
                globalMaxSum = max(globalMaxSum, currentMaxSum)
            }
            
            return globalMaxSum
        }
        
        /// Negates all elements in the given array.
        /// - Parameter numbers: An array of integers.
        /// - Returns: A new array where each element is the negation of the corresponding element in the input array.
        private func negateArray(_ numbers: [Int]) -> [Int] {
            return numbers.map { -$0 }
        }
    }
}
