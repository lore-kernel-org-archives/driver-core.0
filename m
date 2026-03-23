Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317631684A4
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256459; cv=none; b=lzj5Ga+MuHEsY3bJfwDQp5YIVTIn6adzvMCFjS70eW0Wo828/cBEN1/MlRPmpKBpeYFKMb83wFOfZaLdVV3K/DE1efVIBdzcpy3+raW8hoCTO91+rorPvk81XTFh1uL6U0xw+kcKqG4d7ZXoKJ3y74vA/x9o/kvRhRjx893mMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256459; c=relaxed/simple;
	bh=Cl5yPFxk//8Ej78GNhA/VX9CqrDUv6u1CQCqFHTaYvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7W4aeGLdLAEGnm9BcgDSW/UgZO2CS5IFo61VhchS9crAOx1XcIfdufKacoVmvjnznWg+5hMf52HI/6I06fUw0RKb31dpzFCNHYSP58NOUrDGS5kB2sDPCufj7rCidMcR22qNH7cOd3hcniC12ePOx9muOqZ9fTMdF1gpItWjng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmeCb0Nz; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmeCb0Nz"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128b9b7e3edso5980187c88.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 02:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774256457; x=1774861257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0lLd0QkDOzCbjNYQorhBBOJpZyLtToijPDM8Z8Tmtc=;
        b=DmeCb0NzvdITAwvGFJyXK3MCWa6N57S9xAKHJJsVmt/egIc0G6I8Hf6B8Ie5GxLYsn
         jASXC59J/hPAgGRpsf5qmJmschb5tEeGD1HwWSAWmH3Jy8c4ilp+xpfUpkqI+NiIKOPC
         ll1X6oQWAn6DzfoDkDJAVmhBGe4ZUSLOEnz78WTK0pQWNs6HGXih+D+A4IOHRfqZ1p5u
         VVN755/nkDuX1RWMkMVQ7CvGvzJk1Hsyv5rVehQhnJLL9TvBj/QVmiQlxqaet9nvoYba
         sdG8ySdOojX7H05lIzP/tg75mh6y6rmMpzskTGYKVnHUv30Y8Y75M0bqT9YiXlLFIyfX
         FueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256457; x=1774861257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0lLd0QkDOzCbjNYQorhBBOJpZyLtToijPDM8Z8Tmtc=;
        b=FP6hytNnimC86xVK93U11gZZUlxNKq95fxKW2ozuhi7Q4QtiA4TkB+RTWRUJq0Sg3y
         qwwi/4dL2YXxVnYwjEM6cLlxU0st7wdCylvKP8CZ157pdGGjTrEWonGDjyZeCD1xKvS3
         yl/VnXBq8oaq+j/IJXteokWjF8S4m4j97JHJzZdjkHzNfHTBYwsBRS0SeaPQ7DJZ+fYO
         zMMlealsp/aeuJ3N2t7ynU0YSf7ZwXk1YnxabmmWTzs3V6M80zh2BhmjXrHSOZu+myP3
         uj5Pxvn3rbJnNzC1ahLRO0jTSu2EFojVZ/YInknZuJ6LSc8l026cgHXaiKiVRTKy+pfn
         udUA==
X-Forwarded-Encrypted: i=1; AJvYcCXVfhNz0ldgdCW+srKmWZrux4dkV3rInnsNm5Rihfyo+0g+kfs5Gs4D+7qwOMm343Lxqza6EghljD2iXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YycB3YI17mYS2JkUksNxePiKVw3p1cNqEMhSnnYKkOTHY0fBA3Q
	puWNtndMS5YvhYfU4yTOjDi1bmWErcUzh1oBno3JaL4NE3MoD3weEx1a
X-Gm-Gg: ATEYQzwsd4SvBP6H7uhLXjStCIDG3BG3hvXp70FDOiK+SuPv0S5qMsBNPB1W3PcPpaO
	San/cULuX6xpEMRYioP1Xxa9xtxU1RhJNrAnrK8T4bTQQW9CtUJKgFyN1qJgl6jPmAT0FeZulnl
	8Z5PPP+d+G00k8tsMMCwS3d1CuM77BzflUSDIyIIz35ofKHHXPfxc2Zrj2jQ25idZFAsVdQznkJ
	aYjBZR5kXlUO7LgG2ZMLFDGpGFpdEDewOKQHKOTAEFH7+ZOvtEH+A8rqegY+B1k4DbjpvEUet4d
	LTf3lIYN4zV6W2OmWHpysbmbGQviIWHr/v93tuwpdgWWSe07s5KlRZnSVmW1SLeszSDrOacPeIE
	BNw9LxjhTSiMFm3smDpL4oPsDUyiIKf/+0LSC3Lf8f2IDKSW8szTNQ02LSs3CJNldbOppXotJm2
	Xpx4WKY9EFPFjVTDAaqw78LBZ7yM7vEZ9DaGw14bHvEnmsTGRQbs1fx4g7h4vFfY7xJJJAfAXXp
	dGbxuPpVm+yFT0IheN0SNxiWwdhr6r7bqaxrxpMxCq5qxH/2L96oa/yGEh3KeLIASs=
X-Received: by 2002:a05:7022:628c:b0:128:cf5c:5352 with SMTP id a92af1059eb24-12a7266f502mr5323136c88.4.1774256457159;
        Mon, 23 Mar 2026 02:00:57 -0700 (PDT)
Received: from 2045L.localdomain (90.sub-75-221-98.myvzw.com. [75.221.98.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bb33fsm8620227c88.9.2026.03.23.02.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:00:56 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: peterz@infradead.org,
	cristian.marussi@arm.com,
	sudeep.holla@kernel.org,
	linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>,
	yangshiguang <yangshiguang@xiaomi.com>
Subject: [PATCH v2 1/3] debugfs: check for NULL pointer in debugfs_create_str()
Date: Mon, 23 Mar 2026 16:58:44 +0800
Message-ID: <20260323085930.88894-2-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323085930.88894-1-hanguidong02@gmail.com>
References: <20260323085930.88894-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing a NULL pointer to debugfs_create_str() leads to a NULL pointer
dereference when the debugfs file is read. Following upstream
discussions, forbid the creation of debugfs string files with NULL
pointers. Add a WARN_ON() to expose offending callers and return early.

Fixes: 9af0440ec86e ("debugfs: Implement debugfs_create_str()")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/2025122221-gag-malt-75ba@gregkh/
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
v2:
* No changes.
---
 fs/debugfs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 3376ab6a519d..a941d73251b0 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1127,7 +1127,7 @@ static const struct file_operations fops_str_wo = {
  *          directory dentry if set.  If this parameter is %NULL, then the
  *          file will be created in the root of the debugfs filesystem.
  * @value: a pointer to the variable that the file should read to and write
- *         from.
+ *         from. This pointer and the string it points to must not be %NULL.
  *
  * This function creates a file in debugfs with the given name that
  * contains the value of the variable @value.  If the @mode variable is so
@@ -1136,6 +1136,9 @@ static const struct file_operations fops_str_wo = {
 void debugfs_create_str(const char *name, umode_t mode,
 			struct dentry *parent, char **value)
 {
+	if (WARN_ON(!value || !*value))
+		return;
+
 	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
 				   &fops_str_ro, &fops_str_wo);
 }
-- 
2.43.0

