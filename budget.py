import mysql.connector
import streamlit as st
import pandas as pd
mydb = mysql.connector.connect(
    host="localhost",
     user="root",
     password="root",
     database="dbms_project")

c = mydb.cursor()
###RUN 10
def budget():
    tab1,tab2,tab3,tab4=st.tabs(["Create","Read","Update","Delete"])

    with tab1:
        col1,col2,col3=st.columns(3)
        with col1:
            new_budget=st.text_input("Budget")
            new_reserve_fund=st.text_input("Reserve Fund")
            new_labourers_salary=st.text_input("Labourers Salary")
        with col2:
            new_architects_salary=st.text_input("Architects Salary")
            new_designers_salary=st.text_input("Designers Salary")
            new_contractors_salary=st.text_input("Contractors Salary")
        with col3:
            new_site_id=st.text_input("Site ID")
        if st.button("Add Budget Details"):
            add_budget(new_budget,new_reserve_fund,new_labourers_salary,new_architects_salary,new_designers_salary,new_contractors_salary,new_site_id)
            st.success("Successfully added budget details")
        with tab2:
            with st.form(key='budget_read'):
                budget_site_id=st.text_input("Enter Site ID")
                submit_button=st.form_submit_button(label='Submit')
            result=view_all_data_budget(budget_site_id)
            df=pd.DataFrame(result,columns=['Budget','Reserve Fund','Labourers Salary','Architects Salary','Designers Salary','Contractors Salary','Site ID'])
            st.dataframe(df)
        with tab3:
            with st.form(key='budget_update'):
                budget_site_id=st.text_input("Enter Site ID")
                submit_button=st.form_submit_button(label='Submit')
            result=view_all_data_budget(budget_site_id)
            df=pd.DataFrame(result,columns=['Budget','Reserve Fund','Labourers Salary','Architects Salary','Designers Salary','Contractors Salary','Site ID'])
            st.dataframe(df)
            if result:
                budget_reserve=result[0][1]
                new_budget_reserve=st.text_input("Enter new reserve fund",budget_reserve)
                budget_lab=result[0][2]
                new_budget_lab=st.text_input("Enter new Labourers Salary",budget_lab)
                budget_arch=result[0][3]
                new_budget_arch=st.text_input("Enter new Architects Salary",budget_arch)
                budget_des=result[0][4]
                new_budget_des=st.text_input("Enter new Designers Salary",budget_des)
                budget_con=result[0][5]
                new_budget_con=st.text_input("Enter new Contractors Salary",budget_con)
            if st.button("Update Budget Details"):
                c.execute("UPDATE budget SET Reserve_Fund=%s,Labourers_Sal=%s,Architect_Sal=%s,Designer_Sal=%s,Contractor_Sal=%s WHERE Site_ID=%s",(new_budget_reserve,new_budget_lab,new_budget_arch,new_budget_des,new_budget_con,budget_site_id))
                mydb.commit()
                st.success("Successfully updated budget details")
        with tab4:
            with st.form(key='budget_delete'):
                budget_site_id=st.text_input("Enter Site ID")
                submit_button=st.form_submit_button(label='Submit')
            result=view_all_data_budget(budget_site_id)
            df=pd.DataFrame(result,columns=['Budget','Reserve Fund','Labourers Salary','Architects Salary','Designers Salary','Contractors Salary','Site ID'])
            st.dataframe(df)
            if st.button("Delete Budget Details"):
                c.execute("DELETE FROM budget WHERE Site_ID=%s",(budget_site_id,))
                mydb.commit()
                st.success("Successfully deleted budget details")




def view_all_data_budget(budget_site_id):
    c.execute("SELECT * FROM budget WHERE Site_ID=%s",(budget_site_id,))
    result=c.fetchall()
    return result


def add_budget(new_budget,new_reserve_fund,new_labourers_salary,new_architects_salary,new_designers_salary,new_contractors_salary,new_site_id):
    c.execute("INSERT INTO budget(Budget,Reserve_Fund,Labourers_Sal,Architect_Sal,Designer_Sal,Contractor_Sal,Site_ID) VALUES (%s,%s,%s,%s,%s,%s,%s)",(new_budget,new_reserve_fund,new_labourers_salary,new_architects_salary,new_designers_salary,new_contractors_salary,new_site_id))
    mydb.commit()


if __name__=="budget":
    budget()