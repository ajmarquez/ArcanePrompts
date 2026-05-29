# Xcode Cloud Setup

This project is ready for an iOS-first Xcode Cloud workflow that archives
`ArcanePromptsIOS` and distributes successful builds to TestFlight.

## Repo state to finish first

Xcode Cloud builds from the remote Git repository, not only from your local
copy. Before creating the workflow:

1. Commit the current project.
2. Push `main` to `origin`.

Current remote:

- `git@github.com:ajmarquez/ArcanePrompts.git`

## Project choices for this app

- iOS scheme to use: `ArcanePromptsIOS`
- iOS bundle identifier: `com.ajmarquez.ArcanePrompts`
- macOS scheme exists, but keep the first cloud workflow iOS-only
- Shared schemes are already present in the project

## In Xcode

1. Open [ArcanePrompts.xcodeproj](/Users/ajmarquez/Development/ArcanePrompts/ArcanePrompts.xcodeproj).
2. Sign in to Xcode with the Apple Developer account that owns the team.
3. Confirm the `ArcanePromptsIOS` target builds locally with your signing.
4. Create the App Store Connect app record if it does not already exist.
5. In Xcode, go to `Product > Xcode Cloud > Create Workflow`.
6. Connect the GitHub repository when prompted.
7. Choose the `ArcanePromptsIOS` scheme.
8. Choose `main` as the branch for the first workflow.

## Recommended first workflow

Use a distribution workflow, not only a CI workflow.

- Start condition: manual + branch changes on `main`
- Action: archive
- Platform: iOS
- Configuration: `Release`
- Distribution: `TestFlight`
- Audience: internal testers first

That gives you a safe first loop: push to `main`, let Xcode Cloud archive the
app, and deliver it to internal TestFlight testers.

## Recommended workflow name

- `iOS Release to TestFlight`

## Recommended next workflow after that

Create a second workflow once the first one works:

- Name: `PR Validation`
- Start condition: pull requests
- Actions: build + optional tests
- No TestFlight distribution

This keeps TestFlight noise low and reserves distribution for known-good
changes.

## TestFlight notes

- Start with internal testers only.
- Add external testers only after the app metadata is filled out in App Store
  Connect and the first builds look stable.
- If you want automatic external distribution later, create a separate workflow
  for it.

## Important limitation

The initial Xcode Cloud onboarding must be completed in Xcode or App Store
Connect while signed into your Apple team account. This repository cannot
programmatically create that connection by itself.
