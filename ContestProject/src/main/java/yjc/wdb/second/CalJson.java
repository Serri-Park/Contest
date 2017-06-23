package yjc.wdb.second;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class CalJson implements JSONAware {
	@Override
	public String toString() {
		return "CalJson [no=" + no + ", title=" + title + ", start=" + start + ", end=" + end + ", color=" + color
				+ ", u_id=" + u_id + ", t_id=" + t_id + ", schecategory=" + schecategory + "]";
	}

	private int no;
	private String title;
	private String start;
	private String end;
	private String color;
	private String u_id;
	private int t_id;
	private int schecategory;

	public CalJson(int s_id, String s_title, String s_start, String s_end, String s_color, String u_id
			,int  t_id, int schecategory) {
		this.no = s_id;
		this.title = s_title;
		this.start = s_start;
		this.end = s_end;
		this.color = s_color;
		this.u_id = u_id;
		this.t_id = t_id;
		this.schecategory=schecategory;
		
	}

	@Override
	public String toJSONString() {
		JSONObject obj = new JSONObject();
		obj.put("no", no);
		obj.put("title", title);
		obj.put("start", start);
		obj.put("end", end);
		obj.put("color", color);
		obj.put("u_id", u_id);
		obj.put("schecategory", schecategory);
		obj.put("t_id", t_id);
		return obj.toString();
	}
}
