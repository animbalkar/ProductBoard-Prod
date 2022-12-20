public virtual class ProductboardException extends Exception  {

	public Integer status;

	public ProductboardException(String message, Integer status) {
        this(message);
		this.status = status;
	}
}