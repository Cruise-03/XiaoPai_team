package project;


import java.util.Date;

public class Title {
/*
　　　　　*下面这四个属性为数据库表中的四个属性
　　　　　*/
    private int id;   
    private String Plate_number;
    private String date;
    
    
    public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getPlate_number() {
		return Plate_number;
	}


	public void setPlate_number(String plate_number) {
		Plate_number = plate_number;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public Title(int id, String Plate_number,String date) {
        super();
        this.id = id;
        this.Plate_number = Plate_number;
        this.date = date;
    }
    
}