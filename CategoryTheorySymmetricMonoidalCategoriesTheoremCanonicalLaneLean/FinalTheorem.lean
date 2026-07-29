import canonicalLaneMathlib.AdmissibleClass

/-!
# Final Theorem: Constrained Symmetric Monoidal Categories Closure
-/

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

def ConstrainedSymmetricMonoidalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_symmetric_monoidal_endgame (A : AdmissibleClass) :
    ConstrainedSymmetricMonoidalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse