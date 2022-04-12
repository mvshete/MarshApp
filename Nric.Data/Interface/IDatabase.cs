using System.Collections.Generic;
using System.Data.SqlClient;

namespace Nric.Data.Interface
{
    public interface IDatabase
    {
        void SetConnectionString(string connectionString);
        List<T> List<T>(string sql);
        List<T> List<T>(string sql, SqlParameter[] sqlParams);
        void Save(string query, SqlParameter[] sqlParams);
        void Update(string query, SqlParameter[] sqlParams);
        T GetById<T>(string sql, SqlParameter[] sqlParams);
        bool IsEntryAlreadyExist(string sql, SqlParameter[] sqlParams);
    }
}