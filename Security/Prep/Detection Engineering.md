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
[ADS - Alerting Detection Strategy](https://github.com/palantir/alerting-detection-strategy-framework)

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

---

Collection
	Original Point of need. Who said this is an alert we should be looking to detect this? 
		Red team, analysts, client, intel team, Threat Hunters, DFIR, etc.
		
Research
	Identify the logs required to detect this attack.
	
Validation
	Write various detection logic
		Single instance
		Threshold
		Correlation ? 
	Back testing 
	Identify expected volume
	Identify Possible Exceptions
	
Verification
	Make sure the detection fires. 
	Make the detection in prod but tag/flag it as dev so not ready for analysts. 
	Trigger via scripts like atomic red team or Threat Emulation
	
Release
	Prep for release. 
	Peer review
	Volume
	Impact - Mittre Att&ck
	Response Plan
	Documentation
	
Maintain
	Tuning out False Positives

Measure

Data -> Enrich -> Enrich -> Alert -> Investigation -> Remediate

What is malicious ?
	Activities that were not authorized (by US law or Company policy) that inpares the Confidentiality  Integrity or  Availability  

## Core Dispositions:
	
True Positives  (malicious)
False Positive (needs tuning)
True Negative (normal behavior)
False Negative (malicious)

True Positives  (malicious)
	"This is why we do what we do"
	This starts an response of some form.
	- Mitigated
	- Remediated
	- Authorized
False Positive (needs tuning)
	Normal or Authorized activity that was flagged on anyways. Opportunity for tuning. 
	Lots of FPs are from Admins doing admin things, this is normal. Or devs being devs.
True Negative (normal behavior)
	"No news is good news" "Unless something is broken"
False Negative (malicious)
	The absolute worst thing.
	Bad is happened and we missed it. 
	Try to keep down FPs, but FNs are worst the FPs.
	
TP - Benign
	DON'T DO THIS! 

### Sub-catagories.

Was it red team or black hat?
Was it a user being done? Does anything need to be done? 
Was action taken?
Consider RBA (risk based alerts)
	
- Benign
- Mitigated
- Remediated
- Authorized

### Measure

Look for high volume
Look for no volume
True/False Positive Ration
Detection Coverage
Overall health

Consider focusing on the "Left" of the Mirtre Att&ck as that catches things sooner. 
Left is also more likely to hit FPs
