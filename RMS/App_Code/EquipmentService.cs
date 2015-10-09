using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for EquipmentService
/// </summary>
public class EquipmentService
{
    public EquipmentService()
    {

    }
    public string GetEquipmentCode()
    {
        string equipmentCode;
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        int Num1 = 0;
        SqlCommand cmd = new SqlCommand("Select  MAX(EQUIPMENT_ID) from [dbo].[RMSM_MDM_EQUIPMENT_INFO]", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Num1 = int.Parse(dr[0].ToString());
        }
        dr.Close();
        equipmentCode = "EQ00" + (Num1 + 1).ToString();
        con.Close();
        return equipmentCode;
    }
    public void Insert(string EQUIPMENT_CODE, string EQUIPMENT_NAME, string EQUIPMENT_AMOUNT, int COUNT_UNIT_ID, string EQUIPMENT_PATH, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("INSERT INTO [dbo].[RMSM_MDM_EQUIPMENT_INFO] (EQUIPMENT_CODE,EQUIPMENT_NAME,EQUIPMENT_AMOUNT,COUNT_UNIT_ID,EQUIPMENT_PATH,RECORD_STATUS,CREATE_DATE)");
                sql.AppendLine("VALUES (@equipmentCode,@equipmentName,@equipmentAmount,@countUnitID,@equipmentPath,'A',@crDate)");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@equipmentCode", EQUIPMENT_CODE);
                cmd.Parameters.Add("@equipmentName", EQUIPMENT_NAME);
                cmd.Parameters.Add("@equipmentAmount", EQUIPMENT_AMOUNT);
                cmd.Parameters.Add("@countUnitID", COUNT_UNIT_ID);
                cmd.Parameters.Add("@equipmentPath", EQUIPMENT_PATH);
                cmd.Parameters.Add("@crDate", CREATE_DATE);

                try
                {
                    connection.Open();
                    int recordsAffected = cmd.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
    public void Update(string EQUIPMENT_CODE, string EQUIPMENT_NAME, string EQUIPMENT_AMOUNT, int COUNT_UNIT_ID, string EQUIPMENT_PATH, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("UPDATE  [dbo].[RMSM_MDM_EQUIPMENT_INFO]  SET EQUIPMENT_NAME =  @equipmentName ,EQUIPMENT_AMOUNT = @equipmentAmount,COUNT_UNIT_ID = @countUnitID ,EQUIPMENT_PATH =  @equipmentPath ");
                sql.AppendLine(" WHERE  EQUIPMENT_CODE = @equipmentCode");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@equipmentCode", EQUIPMENT_CODE);
                cmd.Parameters.Add("@equipmentName", EQUIPMENT_NAME);
                cmd.Parameters.Add("@equipmentAmount", EQUIPMENT_AMOUNT);
                cmd.Parameters.Add("@countUnitID", COUNT_UNIT_ID);
                cmd.Parameters.Add("@equipmentPath", EQUIPMENT_PATH);
                //cmd.Parameters.Add("@crDate", CREATE_DATE);

                try
                {
                    connection.Open();
                    int recordsAffected = cmd.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }


}
