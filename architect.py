import mysql.connector
import streamlit as st
import pandas as pd

mydb = mysql.connector.connect(
    host="localhost",
     user="root",
     password="root",
     database="dbms_project")
c = mydb.cursor()
###USE 3
def architect():
    tab1,tab2,tab3,tab4=st.tabs(["Create","Read","Update","Delete"])
    with tab1:
        col1,col2=st.columns(2)
        with col1:
            new_architect_id=st.text_input("Architect ID")
            new_architect_fname=st.text_input("Architect First Name")
        with col2:
            new_architect_lname=st.text_input("Architect Last Name")
            new_site_id=st.text_input("Site ID Architect")
        if st.button("Add Architect Details"):
            add_architect(new_architect_id,new_architect_fname,new_architect_lname,new_site_id)
            st.success("Successfully added architect details")
    with tab2:
        with st.form(key='architect'):
            architect_id=st.text_input("Enter Architect ID:")
            submit_button=st.form_submit_button(label='Submit')
        result = view_all_data_architect(architect_id)
        df=pd.DataFrame(result,columns=['Architect ID','Architect First Name','Architect Last Name','Site ID'])
        st.dataframe(df)
    with tab3:
        with st.form(key='architect_id'):
            architect_id=st.text_input("Enter Architect ID:")
            submit_button=st.form_submit_button(label='Submit')
        result = view_all_data_architect(architect_id)
        df = pd.DataFrame(result,columns=['Architect ID','Architect First Name','Architect Last Name','Site ID'])
        st.dataframe(df)
        if result:
            architect_fname=result[0][1]
            new_architect_fname=st.text_input("New Architect First Name:",architect_fname)
            architect_lname=result[0][2]
            new_architect_lname=st.text_input("New Architect Last Name:",architect_lname)
            site_id=result[0][3]
            new_site_id=st.text_input("New Site ID:",site_id)
        if st.button("Update Architect Details"):
            c.execute("UPDATE architect SET Fname=%s,Lname=%s,Site_ID=%s WHERE AID=%s",(new_architect_fname,new_architect_lname,new_site_id,architect_id))
            mydb.commit()
            st.success("Successfully updated architect details: {}".format(architect_id))
    with tab4:
        with st.form(key='architect_id1'):
            architect_id=st.text_input("Enter Architect ID:")
            submit_button=st.form_submit_button(label='Submit')
        result = view_all_data_architect(architect_id)
        df = pd.DataFrame(result,columns=['Architect ID','Architect First Name','Architect Last Name','Site ID'])
        st.dataframe(df)
        if st.button("Delete Architect Details"):
            c.execute("DELETE FROM architect WHERE AID=%s",(architect_id,))
            mydb.commit()
            st.success("Successfully deleted architect details: {}".format(architect_id))

def view_all_data_architect(architect_id):
    c.execute("SELECT * FROM architect WHERE AID=%s",(architect_id,))
    result=c.fetchall()
    return result
def add_architect(new_architect_id,new_architect_fname,new_architect_lname,new_site_id):
    c.execute("INSERT INTO architect VALUES(%s,%s,%s,%s)",(new_architect_id,new_architect_fname,new_architect_lname,new_site_id))
    mydb.commit()
if __name__=="architect":
    architect()
