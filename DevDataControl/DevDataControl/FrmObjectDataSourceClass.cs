using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DevDataControl
{
    public class FrmObjectDataSourceClass
    {
        public SqlDataReader GetMemos()
        {
            SqlConnection objCon = new SqlConnection();
            // Web.config 파일의 커넥션 스트링 값 읽어 오기
            objCon.ConnectionString =
                ConfigurationManager.ConnectionStrings[
                    "DevADONETConnectionString"].ConnectionString;
            objCon.Open();

            SqlCommand objComd = new SqlCommand();
            objComd.Connection = objCon;
            objComd.CommandText = "ListMemo";
            objComd.CommandType = CommandType.StoredProcedure;

            // 데이터리더 값을 반환하고 커넥션 종료
            return objComd.ExecuteReader(CommandBehavior.CloseConnection);
        }
    }
}