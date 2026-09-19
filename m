Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B98134D4DE
	for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789806305; cv=none; b=dZeLNCFj+IcbxGi+s9uGkeEzCObNvYOFzgZ2cNl+85awB2pVwykXPuDxf7LxkArB8MlZn0glHF10FGsJGUANOZlxpRnrad6D5I3caedep7Z8uzoCByeZJAR/w1gk0xj/3ZNnCafq+YUW8Qo9ROZkqHhX/94glzEpfNhponFroSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789806305; c=relaxed/simple;
	bh=A8auyNhtEuZ3z/ymr7Ywj+due7d7kFFg96HOAkuK8BU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I32BJefXV/SlSbWkbqAC6nwYkXIDTFBrN5tHLzYJLOg/LFZnBTzM18uCZBnOCqF14SqJ4W/yG1DcQq3znr2Tdi/v0fjBYiXvAXaJBXWahq153/K5oOSRqbQX/QCghWa0+IGifIM+axKY8QlvB1SJfyMuccGxI0eDrh5Au4R0Q7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpJkWGyD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpJkWGyD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so829105f8f.2
        for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789806302; x=1790411102; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qpDnZPzt3eeYFUUVAX0CfXPjosI2peSH7zQcL7jvG6I=;
        b=GpJkWGyDQvOZtXLVIsSRyC+mGeulKkM7H1XWqMzSolsynWcz8RK+UU2NOC/587IZnn
         ygyns/M14QC5TAQpmrkLcJORu1TkQr5hL0B0Lj+nuu0hAByG7grA59KH22TiyPE+rgBn
         40W5kwae71++YmTm+nUU+j3+d44+ZRa3ttDa8Hqba3zYobOWmjtEzFxsvjfiaJuGiof3
         8xvjRVBjEwH+TzMLcNCEmocQYM8wRkHqhLM17GcCJyNH+X2SKANDaKY9nPCQftskyaJ2
         G5CCp+S9G95xAll/vvaEOAP412gUMqIrFa11LHnCvMQaJqnczQxUl/cpNfm9xUoeD2fj
         2+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789806302; x=1790411102;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qpDnZPzt3eeYFUUVAX0CfXPjosI2peSH7zQcL7jvG6I=;
        b=ojBsMUp9zH0jcfRGNmXAIWmE6iD8tMlWumHw9F7tztVeIeXplCTOalww1daNWQ/cqA
         Bd5J9N71DFdOPln0Bs1oZ9UulEdz8uODc1042EljwCCTrE/YsqmV/YtbmJs/iDAPcXoE
         Hl3fR3DwIcem6eR61OmncA3t+Oy+r6gwlBU3sFx3WZnDOHF7oeQsVwz7Ko9s7iGwHsR/
         HmfyjUUPCaxS+iS4qmt/ZTuTyPx3V2BLJCecee2DiBnmIISPnlAeSnxkFlcMrPaH3PCw
         5MiUmyuBEKSu4I0N0+EY9hQ4CVhj5GJYD9sULpHU6RQwocUw+PcctotfXVJbwWxpDeBH
         PvGw==
X-Forwarded-Encrypted: i=1; AKwUvBx/LDj0VANpxCfsKI2YOjpR2qxY91mugNEyDDr5w6kFPKRIfIvj6C6dwVeNTx3aTYOsEqkt6vlMGnRNWw==@lists.linux.dev
X-Gm-Message-State: AFuF++lj123Xspdfx+hxpSTiWXY2UAiFRNAUmwb6vP/XHZfsu5FwFy0q
	3h4IPEjK1lWv9pzxc6wXAWUTwZHz8/qXro+9h51ah2tGa8ZE6oPuK7JauxkFhg==
X-Gm-Gg: AYBFou1nGSTkb8IINhOnVtYrMGe1Pc+2x8Z2RAer6fz8qnVFCZ5PKaMDtq1KEGeWq/k
	G6mV+NzQ+JNxY7Yab4Cw5eNpqfDfzED6l7ZPhZto1uscnPHNTH9j86rxCUaSpUC/2whObNnLdUu
	wtOk/XMp17sesrmP8TPKqtb4jVAWGw6+YvIqI+mAvYNrSiDw4sNZFhHfL/h9E7WsKhoZWf+8tiI
	a4QCr8aV3x3U1V4PO7s8lEEGV04D0OBfJ/xOnXCePJdrtGLtOFiLq0pN66DJgc3Bltsa3imv9A5
	gGawwjAaq6TLvpSiHkrkvHc9fnC2BHixKkH/cxLSKX5qsmcBq5J3oLHCK0fypnfwXS5x4+xPKtF
	b8j3wrB9MixSFqRh5osZPw0/drH7kWO0KtwmPEXybo3+MXw++GeqwNTNoyhBhlw7BRAMG4Ba//S
	QX55Th3+22EwMr7UXAjO1tEh2HU1QQCUYVy6XJJw4+hYW0TsEvmQeqMcFImBMhPdY2gM9trIF86
	0WYNIWUA2LPjXPIuurQyE4LCjofhgjjWgpg88elJi7E6RQ4IHMEaoWll9OZJFoWno7jtlAdcGUW
	aqf0wHFLWFswRw5FFugG5B7VOqUm3EU8ZmArDpip9veGNBQDtE63AiKiFLzKj+ocGkAEMYCGi4U
	iU55gEqAhEHriqh1Dhv5NK50OFUuOr6JzgxyDK6H5gDPY2A==
X-Received: by 2002:a05:600c:8709:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fc573514bmr121069665e9.12.1789806302202;
        Sat, 19 Sep 2026 01:25:02 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm124608575e9.3.2026.09.19.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:25:01 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 19 Sep 2026 10:24:28 +0200
Subject: [PATCH] PM: runtime: call pm_runtime_dont_use_autosuspend() on
 reinit()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-move-dont-use-autosuspend-v1-1-f6e2d1315c23@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgOxBUWvIg7FRs1gK40VQby7x
 fEN/z+gnIQVhuqBxJeoxFDQ1BXMmwsro/hiMGRa6pse93gx+hhOzMro8hk168HBIxmy1razMx1
 B6Y/Ei9z/e5ze9wMZmtPeawAAAA==
X-Change-ID: 20260919-move-dont-use-autosuspend-0203336ca270
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789806301; l=1969;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=A8auyNhtEuZ3z/ymr7Ywj+due7d7kFFg96HOAkuK8BU=;
 b=7Kqg/mFBM8Y3F5ZHoSq29REYCM9b0RIiz5Uue+7gez/oLWEK/pBUXiVEvtaljGJsmanqtLFVE
 HBQn3CT01BvCStZiii4oh0mGMspJqebT/5/T+/RBwhoSnpOE9G4Jl6Y
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Add a pm_runtime_dont_use_autosuspend() call to pm_runtime_reinit() to
ensure autosuspend is disabled on driver teardown.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
If a driver doesn't use devm_* functions for automatic cleanup on
teardown and autosuspend is enabled during probe, it should also be
disabled on teardown in a _remove() function or equivalent. However,
due to bad documentation, driver authors usually omit the
pm_runtime_dont_use_autosuspend() call on teardown.

Reason for investigating: this week, several patches popped up in
the linux-iio mailing list, adding these missing calls to several
IIO drivers. For some reason I ended up writing a cocci script to
find other instances of this and found ~195 offending drivers.

After a discussion with Frank Li on the matter [1] when sending a similar
patch adding these missing calls to the clk subsystem, we arrived to the
idea of actually adding the dont_use_autosuspend() call to
pm_runtime_reinit() and have driver core handle this instead of
submitting 195+ patches to amend the issue.

[1] https://lore.kernel.org/all/aq1N863eJpD_ZrLU@SMW015318/
---
 drivers/base/power/runtime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index fab38bc98113..9a37f6162fe0 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1874,6 +1874,9 @@ void pm_runtime_reinit(struct device *dev)
 	if (dev->power.runtime_status == RPM_ACTIVE)
 		pm_runtime_set_suspended(dev);
 
+	if (dev->power.use_autosuspend)
+		pm_runtime_dont_use_autosuspend(dev);
+
 	if (dev->power.irq_safe) {
 		spin_lock_irq(&dev->power.lock);
 		dev->power.irq_safe = 0;

---
base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
change-id: 20260919-move-dont-use-autosuspend-0203336ca270

Best regards,
-- 
Kind regards,
Joshua Crofts

