package com.xmmxjy.system.entity;import java.io.Serializable;import java.util.Date;import java.math.BigDecimal;import javax.persistence.Id;import javax.persistence.Table;/** * 描述：数据字典数据 * @author: xmm * @since：2016年12月06日 22时50分09秒 星期二  * @version:1.0 */@Table(name = "rh_dict_data")public class DictDataEntity implements Serializable{	private static final long serialVersionUID = 1L;		/**	 *id	 */	@Id	private String id;	/**	 *名称	 */	private String name;	/**	 *对应的值	 */	private String value;	/**	 *排序，由小到大	 */	private Integer seq;	/**	 *创建人id	 */	private String createBy;	/**	 *创建人	 */	private String createName;	/**	 *修改人id	 */	private String updateBy;	/**	 *修改时间	 */	private Date updateDate;	/**	 *创建时间	 */	private Date createDate;	/**	 *修改人	 */	private String updateName;	/**	 *字典类型ID	 */	private String dictTypeId;	public String getId() {	    return this.id;	}	public void setId(String id) {	    this.id=id;	}	public String getName() {	    return this.name;	}	public void setName(String name) {	    this.name=name;	}	public String getValue() {	    return this.value;	}	public void setValue(String value) {	    this.value=value;	}	public Integer getSeq() {	    return this.seq;	}	public void setSeq(Integer seq) {	    this.seq=seq;	}	public String getCreateBy() {	    return this.createBy;	}	public void setCreateBy(String createBy) {	    this.createBy=createBy;	}	public String getCreateName() {	    return this.createName;	}	public void setCreateName(String createName) {	    this.createName=createName;	}	public String getUpdateBy() {	    return this.updateBy;	}	public void setUpdateBy(String updateBy) {	    this.updateBy=updateBy;	}	public Date getUpdateDate() {	    return this.updateDate;	}	public void setUpdateDate(Date updateDate) {	    this.updateDate=updateDate;	}	public Date getCreateDate() {	    return this.createDate;	}	public void setCreateDate(Date createDate) {	    this.createDate=createDate;	}	public String getUpdateName() {	    return this.updateName;	}	public void setUpdateName(String updateName) {	    this.updateName=updateName;	}	public String getDictTypeId() {	    return this.dictTypeId;	}	public void setDictTypeId(String dictTypeId) {	    this.dictTypeId=dictTypeId;	}}