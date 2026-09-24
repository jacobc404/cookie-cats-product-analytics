# Cookie Cats A/B Test Analysis

## Background

Cookie Cats is a mobile puzzle game where players progress through levels and encounter periodic gates that can temporarily slow progression.

The experiment tested whether moving one of these progression gates from level 30 to level 40 would reduce early friction and improve retention.

## Business Question

Does moving the progression gate from level 30 to level 40 improve 7 day retention without harming early engagement?

## Experiment Setup

Users were randomly assigned to one of two groups:

- Gate 30: progression gate remained at level 30
- Gate 40: progression gate moved to level 40

The dataset contains roughly 90,000 users, with one row per user and fields for experiment assignment, total game rounds, 1 day retention, and 7 day retention.

Before comparing outcomes, I validated that the dataset was at the user level and that experiment allocation was approximately balanced across variants.

## Metrics

### Primary Metric: 7 Day Retention

7 day retention is the main decision metric because the product change was intended to improve longer term player retention.

### Guardrail Metric: 1 Day Retention

1 day retention was used to check whether moving the gate created an immediate negative effect on early retention.

### Supporting Metric: Total Game Rounds

Average and median game rounds were used as supporting behavioral context to check whether any retention change was offset by stronger engagement.

## Results

### Primary Result: 7 Day Retention

- Gate 30: 19.02%
- Gate 40: 18.20%
- Absolute difference: -0.82 percentage points
- p value: 0.0016
- 95% confidence interval: [-1.33, -0.31] percentage points

Moving the gate to level 40 reduced 7 day retention by 0.82 percentage points. The 95% confidence interval remained entirely below zero, and the difference was statistically significant.

### Guardrail Result: 1 Day Retention

- Gate 30: 44.82%
- Gate 40: 44.23%
- Absolute difference: -0.59 percentage points
- p value: 0.0744
- 95% confidence interval: [-1.24, 0.06] percentage points

1 day retention also moved in a negative direction, but the confidence interval crossed zero and the result was not statistically significant at the 5% level.

### Engagement Result

- Average rounds
  - Gate 30: 52.46
  - Gate 40: 51.30
- Median rounds
  - Gate 30: 17
  - Gate 40: 16

Gate 40 did not show a compensating engagement lift. Both average and median rounds were slightly lower than Gate 30.

## Limitations

- The dataset does not contain event level timestamps or progression funnel data.
- There are no pre treatment user characteristics available for deeper segmentation or variance reduction.
- The dataset does not include monetization outcomes.
- Total game rounds is a post treatment behavioral metric, so it is used as supporting context rather than a primary guardrail.
- The experiment shows that Gate 40 underperformed, but it does not explain why.

## Conclusion

Gate 40 reduced 7 day retention by 0.82 percentage points, with a 95% confidence interval entirely below zero. 1 day retention also moved negatively, while average and median rounds were slightly lower.

Taken together, the treatment showed a statistically significant decline in the primary metric and no compensating improvement in the supporting metrics.

I would keep Gate 30 as the default experience.

## Next Steps

Investigate where player behavior begins to diverge between the two experiences using progression level event data.

If gate timing is still worth exploring, test a smaller shift between levels 30 and 40 or pair the gate change with adjustments to rewards or messaging.