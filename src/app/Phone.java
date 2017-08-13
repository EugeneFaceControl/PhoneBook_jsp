package app;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Phone {
    private String id = "";
    private String owner = "";
    private String number = "";

    public Phone(String id, String owner, String number) {
        this.id = id;
        this.owner = owner;
        this.number = number;
    }

    public Phone(String owner, String number) {
        this.id = "0";
        this.owner = owner;
        this.number = number;
    }

    public Phone() {
        this.id = "0";
        this.owner = "";
        this.number = "";
    }

    public boolean validateNumber(String phone) {
        Matcher matcher;
        matcher = Pattern.compile("[0-9+#-]{2,50}").matcher(phone);
        return matcher.matches();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}
