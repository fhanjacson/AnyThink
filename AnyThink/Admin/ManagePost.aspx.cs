using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink.Admin
{
    public partial class ManagePost : System.Web.UI.Page
    {
        SqlConnection dbConnection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AnyThink.mdf;Integrated Security=True");
        public static int postid = 0;



        protected void Page_Load(object sender, EventArgs e)
        {
            panel1.Visible = false;

        }

        protected void search_button_click(object sender, EventArgs e)
        {
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("Select * from Post where Post_ID = '" + searchpostid.Text + "'", dbConnection);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);
            postid = Convert.ToInt32(dt.Rows[0][0]);
            post_id.Text = dt.Rows[0][0].ToString();
            user_id.Text = dt.Rows[0][1].ToString();
            content.Text = dt.Rows[0][2].ToString();
            point.Text = dt.Rows[0][3].ToString();
            date_posted.Text = dt.Rows[0][4].ToString();
            status.Text = dt.Rows[0][5].ToString();
            category.Text = dt.Rows[0][1].ToString();
            panel1.Visible = true;

        }

        protected void update_button_Click(object sender, EventArgs e)
        {
            dbConnection.Open();
            string query = "update Post set content='" + content.Text + "'";
            SqlCommand cmd = new SqlCommand(query, dbConnection);
            cmd.ExecuteNonQuery();
            dbConnection.Close();

        }
    }
}