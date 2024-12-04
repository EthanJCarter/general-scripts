# make_qr.py
#generate a qr code based on a url without weird third party websites
import qrcode

# URL to be encoded in the QR code
url = "https://academic.oup.com/mnras/article/526/4/6248/7317697"

# Generate QR code instance
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4,
)

# Add data to the QR code
qr.add_data(url)
qr.make(fit=True)

# Create an image from the QR code instance
img = qr.make_image(fill_color="black", back_color="white")

# Save the image or display it
img.save("qrcode_mteasdale23.png")
img.show()