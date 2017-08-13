//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package app;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import util.DBWorker;

public class Person {
    private String id = "";
    private String name = "";
    private String surname = "";
    private String middlename = "";
    private HashMap<String, Phone> phonesOfOnePerson = new HashMap<>();

    public Person(String id, String name, String surname, String middlename) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.middlename = middlename;
        ResultSet db_data = DBWorker.getInstance().getDBData("SELECT * FROM `phone` WHERE `owner`=" + id);

        try {
            if (db_data != null) {
                while(db_data.next()) {
                    this.phonesOfOnePerson.put(db_data.getString("id"), new Phone(db_data.getString("id"), db_data.getString("owner"), db_data.getString("number")));
                }
            }
        } catch (SQLException var7) {
            var7.printStackTrace();
        }

    }

    public Person() {
        this.id = "0";
        this.name = "";
        this.surname = "";
        this.middlename = "";
    }

    public Person(String name, String surname, String middlename) {
        this.id = "0";
        this.name = name;
        this.surname = surname;
        this.middlename = middlename;
    }

    public boolean validateFMLNamePart(String fml_name_part, boolean empty_allowed) {
        Matcher matcher;
        if (empty_allowed) {
            matcher = Pattern.compile("[\\w-]{0,150}").matcher(fml_name_part);
            return matcher.matches();
        } else {
            matcher = Pattern.compile("[\\w-]{1,150}").matcher(fml_name_part);
            return matcher.matches();
        }
    }

    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getSurname() {
        return this.surname;
    }

    public String getMiddlename() {
        return this.middlename != null && !this.middlename.equals("null") ? this.middlename : "";
    }

    public HashMap<String, Phone> getPhones() {
        return this.phonesOfOnePerson;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public void setPhones(HashMap<String, Phone> phones) {
        this.phonesOfOnePerson = phones;
    }
}
