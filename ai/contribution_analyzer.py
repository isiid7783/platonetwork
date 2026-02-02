import time

class ContributionAnalyzer:

    def __init__(self):
        self.logs = {}

    def log(self, user):
        self.logs.setdefault(user, []).append(time.time())

    def score(self, user):
        events = self.logs.get(user, [])
        if len(events) < 2:
            return 0
        duration = events[-1] - events[0]
        return duration / len(events)

    def anomaly(self, user):
        events = self.logs.get(user, [])
        if len(events) > 100:
            return True
        return False

if __name__ == "__main__":
    ai = ContributionAnalyzer()
    ai.log("0xABC")
    time.sleep(2)
    ai.log("0xABC")
    print(ai.score("0xABC"))
  
