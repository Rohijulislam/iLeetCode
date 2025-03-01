import Foundation

public struct LC2460 {
    
    class Solution {
        
        /// Applies a series of operations to the input array:
        /// 1. If two consecutive elements are equal, double the first and set the second to zero.
        /// 2. Move all zeros to the end while maintaining the order of non-zero elements.
        ///
        /// - Parameter nums: An array of integers to process.
        /// - Returns: A new array with the applied operations.
        func applyOperations(_ nums: [Int]) -> [Int] {
            // Step 1: Apply the doubling and zeroing operation
            let processedArray = applyDoublingAndZeroing(nums)
            
            // Step 2: Rearrange the array by moving zeros to the end
            return rearrangeArrayByMovingZeros(processedArray)
        }
        
        // MARK: - Private Helper Methods
        
        /// Doubles the value of an element if it matches the next element and sets the next element to zero.
        ///
        /// - Parameter nums: The input array of integers.
        /// - Returns: A new array with the doubling and zeroing applied.
        private func applyDoublingAndZeroing(_ nums: [Int]) -> [Int] {
            var arr = nums
            var i = 0
            
            // Iterate through the array, comparing consecutive elements
            while i < arr.count - 1 {
                if arr[i] == arr[i + 1] {
                    arr[i] *= 2 // Double the current element
                    arr[i + 1] = 0 // Set the next element to zero
                    i += 1 // Skip the next element since it's already processed
                }
                i += 1
            }
            
            return arr
        }
        
        /// Rearranges the array by moving all zeros to the end while preserving the order of non-zero elements.
        ///
        /// - Parameter nums: The input array of integers.
        /// - Returns: A new array with zeros moved to the end.
        private func rearrangeArrayByMovingZeros(_ nums: [Int]) -> [Int] {
            // Separate non-zero elements and zeros
            let nonZeroElements = nums.filter { $0 != 0 }
            let zeroCount = nums.count - nonZeroElements.count
            
            // Append zeros to the end of the non-zero elements
            return nonZeroElements + Array(repeating: 0, count: zeroCount)
        }
    }
}

