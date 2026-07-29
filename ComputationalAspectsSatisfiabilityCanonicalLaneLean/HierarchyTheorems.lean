import HautevilleHouse.ComputationalAspectsSatisfiabilityCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ComputationalAspectsSatisfiabilityCanonicalLaneLean

structure TimeConstructibleFunction where
  f : Nat → Nat
  constructible : ∀ (n : Nat), ∃ (tm : TuringMachine), tm.runsWithin f n

def DTIME (t : TimeConstructibleFunction) : Language → Prop :=
  λ L => ∃ (M : TuringMachine), ∀ (x : BitString),
    (x ∈ L ↔ M.accepts x = true) ∧ M.runsWithin (t.f x.length)

theorem time_hierarchy :
  ∀ (t : TimeConstructibleFunction),
    ∃ (L : Language), DTIME t L ∧ ¬ DTIME (λ n => t.f n ^ 2) L := by
  intro t
  let L : Language := { x | not (M_x.accepts x) }
  have hL : DTIME t L := by
    refine ⟨M_x, λ x => ?_⟩
    constructor
    · intro hx
      simp [L, hx]
    · intro haccepts
      simp [L, haccepts]
    · -- need to show M_x runs within t.f x.length; this is given by construction of M_x
      exact (t.constructible x.length).2
  have hLnot : ¬ DTIME (λ n => t.f n ^ 2) L := by
    intro h
    apply diagonalization
    exact h
  exact ⟨L, hL, hLnot⟩

theorem space_hierarchy :
  ∀ (s : TimeConstructibleFunction),
    ∃ (L : Language), DSPACE s L ∧ ¬ DSPACE (λ n => s.f n ^ 2) L := by
  intro s
  let L : Language := { x | not (M_x.accepts x) }
  have hL : DSPACE s L := by
    refine ⟨M_x, λ x => ?_⟩
    constructor
    · intro hx
      simp [L, hx]
    · intro haccepts
      simp [L, haccepts]
    · exact (s.constructible x.length).2
  have hLnot : ¬ DSPACE (λ n => s.f n ^ 2) L := by
    intro h
    apply diagonalization
    exact h
  exact ⟨L, hL, hLnot⟩

end ComputationalAspectsSatisfiabilityCanonicalLaneLean
end HautevilleHouse