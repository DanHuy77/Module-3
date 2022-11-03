import java.util.Date;

public class Customer {
    private String name;
    private String birthday;
    private String address;
    private String avatar;

    public Customer() {
    }

    public Customer(String name, String birthday, String address, String avatar) {
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
