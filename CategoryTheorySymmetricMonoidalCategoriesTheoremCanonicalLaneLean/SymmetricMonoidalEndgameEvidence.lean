import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure SymmetricMonoidalEndgameEvidence where
  coherenceClosed : Prop
  braidingClosed : Prop
  finalClosure : Prop
  coherenceTerm : coherenceClosed
  braidingTerm : braidingClosed
  finalTerm : finalClosure

def SymmetricMonoidalEndgameClosed (E : SymmetricMonoidalEndgameEvidence) : Prop :=
  E.coherenceClosed ∧ E.braidingClosed ∧ E.finalClosure

theorem symmetric_monoidal_endgame_closed (E : SymmetricMonoidalEndgameEvidence) :
    SymmetricMonoidalEndgameClosed E := by
  exact And.intro E.coherenceTerm (And.intro E.braidingTerm E.finalTerm)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse