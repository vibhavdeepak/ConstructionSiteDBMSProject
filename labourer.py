import mysql.connector
import streamlit as st
import pandas as pd

mydb = mysql.connector.connect(
    host="localhost",
     user="root",
     password="root",
     database="dbms_project")
c = mydb.cursor()
##RUN 22 55
def labourer():
    tab1,tab2,tab3,tab4=st.tabs(["Create","Read","Update","Delete"])
    with tab1:
        col1,col2,col3=st.columns(3)
        with col1:
            new_labourer_id=st.text_input("Labourer ID")
            new_labourer_did=st.text_input("Labourer Dependents ID")
        with col2:
            new_labourer_fname=st.text_input("Labourer First Name")
            new_labourer_lname=st.text_input("Labourer Last Name")
        with col3:
            new_labourer_depname=st.text_input("Labourer Dependents Name")
            new_site_id=st.text_input("Site Identification")

        if st.button("Add Labourer Details"):
            add_labourer(new_labourer_id,new_labourer_did,new_labourer_fname,new_labourer_lname,new_labourer_depname,new_site_id)
            st.success("Successfully added labourer details")
    with tab2:
        with st.form(key='labourer_read'):
            labourer_id=st.text_input("Enter Labourer ID")
            submit_button=st.form_submit_button(label='Submit')
        result=view_all_data_labourer(labourer_id)
        df=pd.DataFrame(result,columns=['Labourer ID','Labourer Dependents ID','Labourer First Name','Labourer Last Name','Labourer Dependents Name','Site Identification'])
        st.dataframe(df)

    with tab3:
        with st.form(key='labourer_update'):
            labourer_id=st.text_input("Enter Labourer ID")
            submit_button=st.form_submit_button(label='Submit')
        result = view_all_data_labourer(labourer_id)
        df = pd.DataFrame(result,columns=['Labourer ID','Labourer Dependents ID','Labourer First Name','Labourer Last Name','Labourer Dependents Name','Site Identification'])
        st.dataframe(df)
        if result:
            labourer_fname=result[0][2]
            new_labourer_fname=st.text_input("Enter new Labourer First Name",value=labourer_fname)
            labourer_lname=result[0][3]
            new_labourer_lname=st.text_input("Enter new Labourer Last Name",value=labourer_lname)
            labourer_depname=result[0][4]
            new_labourer_depname=st.text_input("Enter new Labourer Dependents Name",value=labourer_depname)
            if st.button("Update Labourer Details"):
                c.execute("UPDATE labourers SET Fname=%s,Lname=%s,Dep_Name=%s WHERE LID=%s",(new_labourer_fname,new_labourer_lname,new_labourer_depname,labourer_id))
                mydb.commit()
                st.success("Successfully updated labourer details")
    with tab4:
        with st.form(key='labourer_delete'):
            labourer_id=st.text_input("Enter Labourer ID")
            submit_button=st.form_submit_button(label='Submit')
        result = view_all_data_labourer(labourer_id)
        df = pd.DataFrame(result,columns=['Labourer ID','Labourer Dependents ID','Labourer First Name','Labourer Last Name','Labourer Dependents Name','Site Identification'])
        st.dataframe(df)
        if result:
            if st.button("Delete Labourer Details"):
                c.execute("DELETE FROM labourers WHERE LID=%s",(labourer_id,))
                mydb.commit()
                st.success("Successfully deleted labourer details")








def add_labourer(new_labourer_id,new_labourer_did,new_labourer_fname,new_labourer_lname,new_labourer_depname,new_site_id):
    c.execute("INSERT INTO labourers(LID,DID,Fname,Lname,Dep_Name,Site_ID) VALUES(%s,%s,%s,%s,%s,%s)",(new_labourer_id,new_labourer_did,new_labourer_fname,new_labourer_lname,new_labourer_depname,new_site_id))
    mydb.commit()

def view_all_data_labourer(labourer_id):
    c.execute("SELECT * FROM labourers WHERE LID=%s",(labourer_id,))
    result=c.fetchall()
    return result

if __name__=="labourer":
    labourer()