import mysql.connector
import streamlit as st
import pandas as pd

mydb = mysql.connector.connect(
    host="localhost",
     user="root",
     password="root",
     database="dbms_project")
c = mydb.cursor()
##USE 3 
def contractor():
    tab1,tab2,tab3,tab4=st.tabs(["Create","Read","Update","Delete"])
    with tab1:
        col1,col2,col3=st.columns(3)
        with col1:
            new_contractor_fname=st.text_input("Contractor First Name")
            new_contractor_lname=st.text_input("Contractor Last Name")
        with col2:
            new_contractor_contact=st.text_input("Contractor Contact")
            new_contractor_experience=st.text_input("Contractor Experience")
        with col3:
            new_contractor_CID=st.text_input("Contractor CID")
            new_contractor_site_id=st.text_input("Contractor Site ID")
        if st.button("Add Contractor Details"):
            add_contractor(new_contractor_fname,new_contractor_lname,new_contractor_contact,new_contractor_experience,new_contractor_CID,new_contractor_site_id)
            st.success("Successfully added contractor details")
    with tab2:
        with st.form(key='contractor_read'):
            contractor_id=st.text_input("Enter Contractor ID")
            submit_button=st.form_submit_button(label='Submit')
            result=view_all_data_contractor(contractor_id)
            df=pd.DataFrame(result,columns=['First Name','Last Name','Contact','Experience','CID','Site ID'])
            st.dataframe(df)
    with tab3:
        with st.form(key='contractor_update'):
            contractor_id=st.text_input("Enter Contractor ID")
            submit_button=st.form_submit_button(label='Submit')
        result=view_all_data_contractor(contractor_id)
        df=pd.DataFrame(result,columns=['First Name','Last Name','Contact','Experience','CID','Site ID'])
        st.dataframe(df)
        if result:
            contractor_contact=result[0][2]
            new_contractor_contact=st.text_input("Enter new Contact Name")
            if st.button("Update Contractor Details"):
                c.execute("UPDATE contractors SET Contact_Name=%s WHERE CID=%s",(new_contractor_contact,contractor_id))
                mydb.commit()
                st.success("Successfully updated contractor details")
    with tab4:
        with st.form(key='contractor_delete'):
            contractor_id=st.text_input("Enter Contractor ID")
            submit_button=st.form_submit_button(label='Submit')
        result=view_all_data_contractor(contractor_id)
        df=pd.DataFrame(result,columns=['First Name','Last Name','Contact','Experience','CID','Site ID'])
        st.dataframe(df)
        if result:
            if st.button("Delete Contractor Details"):
                c.execute("DELETE FROM contractors WHERE CID=%s",(contractor_id,))
                mydb.commit()
                st.success("Successfully deleted contractor details")



def view_all_data_contractor(contractor_id):
    c.execute("SELECT * FROM contractors WHERE CID=%s",(contractor_id,))
    result=c.fetchall()
    return result
def add_contractor(new_contractor_fname,new_contractor_lname,new_contractor_contact,new_contractor_experience,new_contractor_CID,new_contractor_site_id):
    c.execute("INSERT INTO contractors (Fname,Lname,Contact_Name,Experience,CID,Site_ID) VALUES (%s,%s,%s,%s,%s,%s)",(new_contractor_fname,new_contractor_lname,new_contractor_contact,new_contractor_experience,new_contractor_CID,new_contractor_site_id))
    mydb.commit()



if __name__=="contractor":
    contractor()