Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06F51DED4C
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256541; cv=none; b=FrwJmp9GrhUf2ayYEgrQ3VlG/epjMEPQe/t4MN5oG8X4lUd6vqIlmdCudpBwVflQiUrQburkXbAgyT7a3hWYnl1UgMeG/6gDbUF9ryrm5G8apPN7o+RyY8fHI/fFueL0eRQ40mpI40wD/l9eRXpxfHy82T3dpk390MtRxD6DXVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256541; c=relaxed/simple;
	bh=gq1YDhINbE7C0TGxm6aIJ7yhmIyt+boZmjgdjZwN9lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0W808/5I5ccmr7yW64pQrCDCiVXfhjzbbTm60c5XDKQd8xuhpYb/a8I6pFAQrzLgdTGFpfbVO5cseolI8+incNGpNE0AsmuFYQeb9AL4N40aB5D1YXARmteAvXu3v3WvEA3DCo9JqnUTwp/2oYKcQbw8qyGW/zagBpOz8CNWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOjVIKxA; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOjVIKxA"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128b9b7e3edso5983014c88.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774256540; x=1774861340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xrYmE2Pi3T7YtcUDRXPeAvmyynPywp5N49YDr8P630=;
        b=JOjVIKxAr9z8ZIhIphhy96qHi2ZQCJp023dv2R1aBG7AZPR90DGF5Q3WY95vGqY/Ax
         ZEjZrq86tUSlGax686Zi0RLMeyXF/wFFSoR4zNfZwhgMN2EufLIlNKeDhYsDnMyo+9xB
         YHLuY+nRgAlGmPks0PsznRxn8n87n7O7slae6t1tYD59sVqWTwAgjCetNbUqRB2wJfCF
         Njy9L5sMdMNDB5JWM5/8ahW1lBlyXNUlDAglM0h43r5/aQFa5AW4RY611mBvxCvtD33u
         hERqdCa0tVQ2Dvy///FhGEFTmIMyZD2NEJo7Xh9l4o9xUwT0TqG13doZeF3g746GFhiW
         3KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256540; x=1774861340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xrYmE2Pi3T7YtcUDRXPeAvmyynPywp5N49YDr8P630=;
        b=rE43y8qH3VOa3qkFRgo8qTAnljNB2aZZgo7UiBQCwY04IrAugDjTbRZN63iXwCGvgG
         +joCoUq6HAICkOASMoiagZOOJ/asYFxmry5uAX5MjbAWyrJ1e4a8Nhqb9MvkIW/U+QHb
         rNsKvkBIQKsT5wMrHQvNFwi0woCv017yICqxzNfYQwFfEw3ZuVxUeVg3RkqGXwG+JrqY
         foy1+NFN9tCX1bkEWC11SXtxDB9xeVIu6lL4LiM8v/A/a1MKkmcM2iE9pDxtc1Gp6dE7
         e3E4ZEPp8bevuZd/YOi0M8mILvuZNIcggobwn3Y/+4HBkRfgY3GcKZDQRdc1PcH/m9Vv
         YtIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5KMbgSA/TxNXB/sEM6TWKHUrWnFSAAyWLCkuuCgxe3dN9oSfN0q0BcZPkOlncMsX6049c5wN/UGtqNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhq2AijqpV2/Z5ozvO0xiK1mlcyv2CbC8QMpmNGD4ZlcylN0CJ
	FD9UNLs/Y3L/9jfuWqIADF1TMkrq3epdYX0stQ2MSv1vzrqcgEOSpDIW
X-Gm-Gg: ATEYQzwmNS6fZ8LSnTGsBDDMU7pmSptsadc16q3fox+HVUwehkVcwIcuGVY4q6UXRCx
	8hMVpWc6or/EerQPwY4M/loihHG8o3ELTJw1Df3YBYjKezDZq3kJ7CiAdO6ShMuRcDmRzGsfORi
	iBhtioWtBW+nKllMbvtyHEnhLr6lxtBueEHQyWzgGVIBV+eyy1IfSFho0nxGnMRjgRdjXd9OJkF
	g8ud1nbSh3aSLgAxxiY9KqMntSXdb3/Ea/SmovLqP6ozorlsz42nS0SDdAIqznsJN103nbB2ABj
	n3bzpVVEhfFQ/d9BxwWI5P2+i8YwFWu4T6NqnmSoy28C1PQOrqikJoMZleam3ynEcIgPbQIslan
	Jq4wx0Yp6GGPkEZBJoopQLmEihfpXR/JX9Cvv/NhvM0il43BIaELKezX/wZkidjrpZI9cTw/Y6c
	Llcq48SN42YDi+SyG4DJSdB/h737Z8VT3IEyZc9p6MAsDCBiSnlET4YggsQB3YuSFzd1nVKrAjV
	9MGIHZb/NCFLQRv4JVqp2MfP+kmCX188HGYhSt/HWQLiiswNR3uO0qG20sEBONyaMF70BrVIWvu
	cA==
X-Received: by 2002:a05:7022:68a4:b0:124:9e46:82d6 with SMTP id a92af1059eb24-12a726d995bmr5281257c88.25.1774256539707;
        Mon, 23 Mar 2026 02:02:19 -0700 (PDT)
Received: from 2045L.localdomain (90.sub-75-221-98.myvzw.com. [75.221.98.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bb33fsm8620227c88.9.2026.03.23.02.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:02:19 -0700 (PDT)
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
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH v2 2/3] debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
Date: Mon, 23 Mar 2026 16:58:45 +0800
Message-ID: <20260323085930.88894-3-hanguidong02@gmail.com>
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

The EXPORT_SYMBOL_GPL() for debugfs_create_str was placed incorrectly
away from the function definition. Move it immediately below the
debugfs_create_str() function where it belongs.

Fixes: d60b59b96795 ("debugfs: Export debugfs_create_str symbol")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
v2:
* No changes.
---
 fs/debugfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index a941d73251b0..edd6aafbfbaa 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1047,7 +1047,6 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(debugfs_create_str);
 
 static ssize_t debugfs_write_file_str(struct file *file, const char __user *user_buf,
 				      size_t count, loff_t *ppos)
@@ -1142,6 +1141,7 @@ void debugfs_create_str(const char *name, umode_t mode,
 	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
 				   &fops_str_ro, &fops_str_wo);
 }
+EXPORT_SYMBOL_GPL(debugfs_create_str);
 
 static ssize_t read_file_blob(struct file *file, char __user *user_buf,
 			      size_t count, loff_t *ppos)
-- 
2.43.0

