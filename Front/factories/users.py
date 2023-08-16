def factory_user_successfully():
    
    user = {
        "name" : "Dath Cavalher",
        "email" : "Dath@test.com",
        "ordem" : "Jedi",
        "tpjedi" : "Cavaleiro Jedi",
        "bdate" : "abril-1993-19",
        "instagram" : "@dath-cavalher"
    }

    return user

def factory_user_wrong_email():
    
    user = {
        "name" : "Dath Cavalher",
        "email" : "Dath-test.com",
        "ordem" : "Jedi",
        "tpjedi" : "Cavaleiro Jedi",
        "bdate" : "abril-1993-19",
        "instagram" : "@dath-cavalher"
    }

    return user