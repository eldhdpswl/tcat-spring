package spring.project.tcat.VO;


public class SaleVO {

	
	String buyDate;
	int perCount;
	int perPrice;
	int storeCount;
	int storePrice;
	int totalPrice;
	String sale_div;
	int sale_rate;

	
	public int getTotalPrice() {
	return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPerCount() {
		return perCount;
	}
	public void setPerCount(int perCount) {
		this.perCount = perCount;
	}
	public int getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(int perPrice) {
		this.perPrice = perPrice;
	}
	public int getStoreCount() {
		return storeCount;
	}
	public void setStoreCount(int storeCount) {
		this.storeCount = storeCount;
	}
	public int getStorePrice() {
		return storePrice;
	}
	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public String getSale_div() {
		return sale_div;
	}
	public void setSale_div(String sale_div) {
		this.sale_div = sale_div;
	}
	public int getSale_rate() {
		return sale_rate;
	}
	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}
 	
}
