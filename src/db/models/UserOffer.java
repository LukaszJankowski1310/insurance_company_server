package db.models;

public class UserOffer {
    private String brand;
    private String model;
    private String insurer;
    private float price;

    public UserOffer(String brand, String model, String insurer, float price) {
        this.brand = brand;
        this.model = model;
        this.insurer = insurer;
        this.price = price;
    }

    public String prepareUserOfferToSend() {
        return String.format("%-10s %-10s %-10s %.2f", brand, model, insurer, price);
    }


    public static void displayTableOfUserOffers() {
        System.out.printf("%-10s %-10s %-10s %s%n", "brand", "model", "insurer", "price");
    }

}
