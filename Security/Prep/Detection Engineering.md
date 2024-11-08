# Detection Engineering

Using the scientific method to create a framework for detecting security events.

1. Observation
2. Research
3. Hypothesis
4. Experimentation
5. Analysis
6. Report / Conclusions
7. Repeat

Theory -> High Quality Detection

## Detection Engineering Framework

### 0 Detection Story

- Reason
- Data Source
- Example Logic
- Expected Volume
- Supporting Artifacts
    Sources:
- Peers
- Management
- Public feeds
- Past Attacks
- Customer Requests
- etc.

### 1 Research

- Experiment with different ways to detect things.
- Document as you go.
- Keep scope in mind

### 2 Query

- Build a query.
- Keep it balanced
    Too broad and you risk burnout and high volume
    Too narrow and you risk missing events if something changes
- Keep it as agnostic and reusable as possible (i.e. multi tenant.)
- Allow for exceptions
    i.e. Legacy apps, or special users.
- When filtering, keep in mind Risk Management. 
    Avoidance - Filtering very selectively and dealing with more potential volume 
    Transfer - Scheduling threat hunts to look for a certain TTP on a regular cadence
    Acceptance - Sometimes a high volume detection is not worth the value it brings
    Mitigation - Having other detections for similar or related TTPs (defense in depth)

### 3 Backtest

Estimate volume
    90 days ideal, 30 days minimum.
If you see no results in your backtest, document that.
If you get way to many alerts, you have some options.
    0. Drop the detection idea
    1. Lower priority detection
    2. Re-asses the query

### 4 Canary

Test case to validate the detection into the future.
Atomic Red Team?
Alert on failure
Have a red-teamer try to break it?

### 5 Documentation

Spell out EVERYTHING about the detection.

- What's it detecting?
- Notes on filtering
- Resources
How to respond
[ADS - Alerting Detection Stratagy](https://github.com/palantir/alerting-detection-strategy-framework)

### 6 Onboarding

Put it in the SIEM without full alerts.
Review results to ensure everything is working BEFORE creating tickets.
Make sure you have 1 alert per event.
Suppress / Group to a single event.

### 7 Continuous Improvement


## Terms

Detection / Rule - Search Syntax that detects an event from the logs.

False Positive

Alert - The single output of detection

Ticket - A item in the ticket system to be worked by an human.
