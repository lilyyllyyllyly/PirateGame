class_name OneshotSignal extends Behaviour

signal done

func do():
	if !enabled: return

	done.emit()
	enabled = false;

