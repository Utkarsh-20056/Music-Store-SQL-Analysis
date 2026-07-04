#
Music Store Database Import Script

Instructions:
1. Run 01_database_setup.sql
2. Drop the employee foreign key (see 04_employee_fk.sql)
3. Update the database password and CSV folder path below.
4. Run this script.
5. Re-add the employee foreign key.
#

import pandas as pd
from sqlalchemy import create_engine

# ===========================
# MySQL Connection
# ===========================

engine = create_engine(
    "mysql+pymysql://root:YOUR_PASSWORD@localhost/music_store"
)

folder = r"data"

# # ===========================
# # Artist
# # ===========================

artist = pd.read_csv(folder + r"\artist.csv")
artist.to_sql("artist", con=engine, if_exists="append", index=False)
print("✅ Artist Imported")

# # ===========================
# # Album
# # ===========================

album = pd.read_csv(folder + r"\album.csv")
album.to_sql("album", con=engine, if_exists="append", index=False)
print("✅ Album Imported")

# # ===========================
# # Media Type
# # ===========================

media_type = pd.read_csv(folder + r"\media_type.csv")
media_type.to_sql("media_type", con=engine, if_exists="append", index=False)
print("✅ Media Type Imported")

# # ===========================
# # Genre
# # ===========================

genre = pd.read_csv(folder + r"\genre.csv")
genre.to_sql("genre", con=engine, if_exists="append", index=False)
print("✅ Genre Imported")

# # ===========================
# # Playlist
# # ===========================

playlist = pd.read_csv(folder + r"\playlist.csv")
playlist.to_sql("playlist", con=engine, if_exists="append", index=False)
print("✅ Playlist Imported")

# # ===========================
# # Track
# # ===========================

track = pd.read_csv(folder + r"\track.csv")
track.to_sql("track", con=engine, if_exists="append", index=False)
print("✅ Track Imported")


# ==========================================
# Employee
# ==========================================

employee = pd.read_csv(folder + r"\employee.csv")

employee["birthdate"] = pd.to_datetime(employee["birthdate"], format="mixed")
employee["hire_date"] = pd.to_datetime(employee["hire_date"], format="mixed")

employee.to_sql("employee", con=engine, if_exists="append", index=False)
print("✅ Employee Imported")


# ==========================================
# Customer
# ==========================================

customer = pd.read_csv(folder + r"\customer.csv")

customer.to_sql("customer", con=engine, if_exists="append", index=False)
print("✅ Customer Imported")


# ==========================================
# Invoice
# ==========================================

invoice = pd.read_csv(folder + r"\invoice.csv")

invoice["invoice_date"] = pd.to_datetime(invoice["invoice_date"])

invoice.to_sql("invoice", con=engine, if_exists="append", index=False)
print("✅ Invoice Imported")


# ==========================================
# Invoice Line
# ==========================================

invoice_line = pd.read_csv(folder + r"\invoice_line.csv")

invoice_line.to_sql("invoice_line", con=engine, if_exists="append", index=False)
print("✅ Invoice Line Imported")


# ==========================================
# Playlist Track
# ==========================================

playlist_track = pd.read_csv(folder + r"\playlist_track.csv")

playlist_track.to_sql("playlist_track", con=engine, if_exists="append", index=False)
print("✅ Playlist Track Imported")


print("\n🎉 All Tables Imported Successfully!")