class Stadium:
    """This is a stadium"""

    def __init__(self, name, city_state, capacity):
        """Initializer"""
        self.name= name
        self.city_state=city_state
        self.capacity=capacity 

    def describe_stadium(self):
        """Describes the stadium"""
        print("The",self.name, "in", self.city_state, "holds", self.capacity, "people!")
    
    def sport_played(self, sport):
        """Tells the sport played"""
        print("The main sport played here is", sport)
    
    def seats_available(self, seats):
        """mentions seats left in stadium"""
        print("There are still", seats, "seats left, so come on out to the game!")


stadium1= Stadium('Petco Park Stadium', 'San Diego, CA', '42,445')

stadium1.describe_stadium()
stadium1.sport_played('Baseball.')
stadium1.seats_available('17,405')