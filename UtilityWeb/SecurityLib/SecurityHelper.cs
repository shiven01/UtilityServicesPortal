using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace SecurityLib
{
    /// <summary>
    /// Security helper - Shiven Shekar Component
    /// </summary>
    public class SecurityHelper
    {
        /// <summary>
        /// Hashes a string using SHA256
        /// </summary>
        /// <param name="input">String to hash</param>
        /// <returns>Hashed string in hexadecimal</returns>
        public static string HashString(string input)
        {
            if (string.IsNullOrEmpty(input))
                return string.Empty;

            input = input.Trim();

            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(input);
                byte[] hash = sha256.ComputeHash(bytes);

                StringBuilder result = new StringBuilder();
                foreach (byte b in hash)
                {
                    result.Append(b.ToString("x2"));
                }
                return result.ToString();
            }
        }
    }
}
