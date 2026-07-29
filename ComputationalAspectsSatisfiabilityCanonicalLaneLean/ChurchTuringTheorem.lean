import HautevilleHouse.ComputationalAspectsSatisfiabilityCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ComputationalAspectsSatisfiabilityCanonicalLaneLean

structure TuringMachine where
  states : Nat
  alphabet : List Bool
  transitionFunction : Nat × Bool → Nat × Bool × Bool
  startState : Nat
  acceptState : Nat

def HaltingProblem : Language :=
  { x : BitString | TuringMachine x accepts x }

def ComputableFunction (f : BitString → BitString) : Prop :=
  ∃ (tm : TuringMachine), ∀ (x : BitString), tm.accepts x → tm.output x = f x

theorem church_turing_thesis_closure_condition :
  ∀ (A : AdmissibleClass), ∃ (tm : TuringMachine), ∀ (x : BitString),
    (x ∈ A.lane.language) ↔ tm.accepts x = true := by
  intro A
  exact ⟨A.lane.solver, λ x => A.solverDecidesProjectedLanguage x⟩

end ComputationalAspectsSatisfiabilityCanonicalLaneLean
end HautevilleHouse