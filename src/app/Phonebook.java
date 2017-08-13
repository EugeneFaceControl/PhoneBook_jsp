//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package app;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import util.DBWorker;

public class Phonebook {
    private HashMap<String, Person> persons = new HashMap();
    private HashMap<String, Phone> phones = new HashMap();
    private DBWorker db = DBWorker.getInstance();
    private static Phonebook instance = null;

    public static Phonebook getInstance() throws ClassNotFoundException, SQLException {
        if (instance == null) {
            instance = new Phonebook();
        }

        return instance;
    }

    protected Phonebook() throws ClassNotFoundException, SQLException {
        ResultSet db_data = this.db.getDBData("SELECT * FROM `person` ORDER BY `surname` ASC");

        while (db_data.next()) {
            this.persons.put(db_data.getString("id"), new Person(db_data.getString("id"), db_data.getString("name"), db_data.getString("surname"), db_data.getString("middlename")));
        }

        ResultSet db_dataPhoto = this.db.getDBData("SELECT * FROM `phone` ORDER BY `owner` ASC");

        while (db_dataPhoto.next()) {
            this.phones.put(db_dataPhoto.getString("id"), new Phone(db_dataPhoto.getString("id"), db_dataPhoto.getString("owner"), db_dataPhoto.getString("number")));
        }

    }

    public boolean addPhone(Phone phone) {
        String query = "";
        if (!phone.getNumber().equals("")) {
            query = "INSERT INTO `phone` (`owner`, `number`) VALUES ('" + phone.getOwner() + "', '" + phone.getNumber() + "')";
        }

        Integer affected_rows = this.db.changeDBData(query);
        if (affected_rows.intValue() > 0) {
            phone.setId(this.db.getLastInsertId().toString());
            this.phones.put(phone.getId(), phone);
            return true;
        } else {
            return false;
        }
    }

    public boolean addPerson(Person person) {
        String query;
        if (!person.getSurname().equals("")) {
            query = "INSERT INTO `person` (`name`, `surname`, `middlename`) VALUES ('" + person.getName() + "', '" + person.getSurname() + "', '" + person.getMiddlename() + "')";
        } else {
            query = "INSERT INTO `person` (`name`, `surname`) VALUES ('" + person.getName() + "', '" + person.getSurname() + "')";
        }

        Integer affected_rows = this.db.changeDBData(query);
        if (affected_rows.intValue() > 0) {
            person.setId(this.db.getLastInsertId().toString());
            this.persons.put(person.getId(), person);
            return true;
        } else {
            return false;
        }
    }

    public boolean updatePhone(String id, Phone phone) {
        Integer id_filtered = Integer.parseInt(phone.getId());
        String query = "";
        if (!phone.getNumber().equals("")) {
            query = "UPDATE `phone` SET `number` = '" + phone.getNumber() + "' WHERE `id` = " + id_filtered;
        }

        Integer affected_rows = this.db.changeDBData(query);
        if (affected_rows.intValue() > 0) {
            this.phones.put(phone.getId(), phone);
            return true;
        } else {
            return false;
        }
    }

    public boolean updatePerson(String id, Person person) {
        Integer id_filtered = Integer.parseInt(person.getId());
        String query = "";
        if (!person.getSurname().equals("")) {
            query = "UPDATE `person` SET `name` = '" + person.getName() + "', `surname` = '" + person.getSurname() + "', `middlename` = '" + person.getMiddlename() + "' WHERE `id` = " + id_filtered;
        } else {
            query = "UPDATE `person` SET `name` = '" + person.getName() + "', `surname` = '" + person.getSurname() + "' WHERE `id` = " + id_filtered;
        }

        Integer affected_rows = this.db.changeDBData(query);
        if (affected_rows.intValue() > 0) {
            this.persons.put(person.getId(), person);
            return true;
        } else {
            return false;
        }
    }

    public boolean deletePhone(String id) {
        if (id != null && !id.equals("null")) {
            int filtered_id = Integer.parseInt(id);
            Integer affected_rows = this.db.changeDBData("DELETE FROM `phone` WHERE `id`=" + filtered_id);
            if (affected_rows.intValue() > 0) {
                this.phones.remove(id);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean deletePerson(String id) {
        if (id != null && !id.equals("null")) {
            int filtered_id = Integer.parseInt(id);
            Integer affected_rows = this.db.changeDBData("DELETE FROM `person` WHERE `id`=" + filtered_id);
            if (affected_rows.intValue() > 0) {
                this.persons.remove(id);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public HashMap<String, Person> getContents() {
        return this.persons;
    }

    public HashMap<String, Phone> getPhoneContents() {
        return this.phones;
    }

    public Person getPerson(String id) {
        return (Person) this.persons.get(id);
    }

    public Phone getPhone(String id) {
        return (Phone) this.phones.get(id);
    }

}
