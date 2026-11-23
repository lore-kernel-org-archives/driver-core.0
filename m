Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436209;
	b=xSZTPoroIhBrcHRFX4n+7r9zDk0zi/FTxt6Av1a0KqTmhKGz7iO7aPCLUITg3VXssyem
	 XnmmGxdgCZuP0ezoI5DB1cf+do107fn0mjTBPOL8AoM3NLsws4DxNozDOZtApfElCLFJm
	 oOYX9WvZ3N2jC2BRM1MQvfBpXs+klCSEJjA0wtzgao1L6yi58MvYeTnLzvMQKnAJA5sNl
	 VrkpxKaIgwg4Xji+5Lx/RCvb/dcA0dk9smijMPYakjU5Iw4maBWU/UZxvDc2ZdYq+Sy47
	 ufnyX3i7x87d/Rz0DwluIGD8tUACXui4Z08mRl0r/XLhbvUI2psVN684orn7+KsJ3eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e4OCxwaZr9TnfdRR/mUAU5CvloH0RPFSydGvfkrf2yc=;
	b=IYFL0wUztNTLSUwsJ3YBxIwHG9EuNebHWk5ZmUJcApL7uth3Xc70zBvQsH2bmzytUfNE
	 3w+18oZhXx/GLktoHq2qdxYVi99U8bkx6nPSMEg/YDmJgjZTK+wCu89tofPJDVi0AdTru
	 +bwGZeWmEWqSWx2XVqor5edAsYwFsypNNuNAonk8G36Dbs1aMLrNwnGlwTW6pdEX9dQXu
	 qzu0ygeUfADQ3s+m7rj8N6XBTRTnf4V6FdPj7DH8HWJ/Y5VpaRC+SaWNSSGQyU8aBpAmY
	 LAloA51eYXwZQNE3QXJKliZ1reCNYsQJ682QYj5oXD9813BWrfhSG05MeMQRt1kIa8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=MXwK0juR;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD545606A332
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 12:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD545606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=MXwK0juR
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1234627a91.2
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 04:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795436208; x=1796041008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4OCxwaZr9TnfdRR/mUAU5CvloH0RPFSydGvfkrf2yc=;
        b=MXwK0juRAdjh4vZtNds+Nb0h6kkXdZ29TUZobTv97UHC/s+ZLLAXa3xJvdp3cqTHFT
         GIRBj/Git5z+ZjNaCNO/fx0S8e/EMg2YE79NpaaNaquJ4GH0gagnOMSf25GlPdHzuh/4
         ei9u19FLA+6GQxOwJgELVhvvwYcWash/FxYU1RSnaSqh2c6TkogRhBl1aYDCsllk1YZu
         XU3Z8CYldXqWU+jx1WH33EnIT4dvCdUuaE6DEYGyPDIpwP9ClY+0y4qsN7R482dZPMro
         5vYR0vVyKmjF+ayeKRfZ5CiQBZr99xUY2sSrNaXcMy4z02q9K66WMRHTEi8ThGtCWlwM
         PtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436208; x=1796041008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4OCxwaZr9TnfdRR/mUAU5CvloH0RPFSydGvfkrf2yc=;
        b=IG6WZU0pfz2inkz7BdpnGxA1++ZITkT9jHm2ImbynHTtbq8xBY2VPfv8qC7xQ6jDwS
         cgJ/hVqraxlmqH3V0NoeN01iad/YOOxPWx97p67YzL2tRE9EObBz3dYdxUwT9fZdI5nj
         4SyBibGMvYm7l31pVLCp5kI2u8bcjXSlIMjs7qDwoUAb2wqOqFFQzZOriMUZSSAWraI3
         Ak3xikCstfKbn2/KJcGkW/VR44UBweZqHXDOcLIezBoncGXSBavljTh8bpp2f/BXG5X8
         KR2f24Q2keaXf2R1Inn/wZ9yMgEx1w10Tko5wcXREGYJQ4qMM7atu9rYeYB/H2KGL56g
         M1SA==
X-Forwarded-Encrypted: i=1; AL+hErG0cS2yx1XRpoEP+lVloKmodPFnf2uj1XOtp1kOCtqk9MFl9heaL+Rgmrod9UchiHXsmrsw+p+mLg0Srw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8dbENb6tgpGFUghjlDGHiBlfIEFbu7fe6TECgF85aG517oIs4C
	6aQz7r+WqfXdDq8ayslPzxZVQV+hYz/IrP9qWQTr1CdLhwHelcPleXV2jVGIoTXBDMADV1ec17N
	p7028Sw==
X-Gm-Gg: AZFdTZdYWy+lSIG7JT+1ZmXetHfqbCrjQaVABWBkT5mcQj0Jq1ReGoQTmBT4Zjei+GP
	8wQqIWtQJbWvdBAT9TcOYNKVcWH1MA814d4/RTXapsuhwEpxHAArZHnM/C/UXOgqk33lK0IkRNW
	6yiPRJK6E/EUBkY3zwz8zYs+zmF7jx7thz+qRS+gmAV76ebMNav45/LliB+YeOvp3Cs+athdpz0
	HfETJhBHjiZWm7qt9rofLl3HpsrCenszdMI6YVlO98QkiMJ6afkSZbrhG2U68SgqH5TWobhMwKn
	XbhMThEpyZWbS3ivHnfIpDej+G0DRyjYm2fZslY0xGUKl8Fh7LPzITfxa+fBYoZ1yaO/YAQHVp5
	hDka3ZHEQnyumUso2xhdxpS3f9Gw746CuHGC7Jl6/ucHsKNpJMCjRB4isa/dC15KGhSDpakvlhJ
	3e2xk2HoDXPyhbC442LtR3hLkuOi6FSETrpTRhu3pXvu9dvt5N7k58QMAd+R55kU9fIY/Ui8DpI
	TxSN+tFVZ75jPOiUb7XCCN5O3aAH4P0Y3PPumnDloMys94CUfUy6hpVl/owqSDfSoTTX7enCLGm
	eXHjVVA+9l/jwYG4vBraFgBJKzG/RfdG2yYQQw6Bz5cbLX4E5rJr+UMa2hLeKg==
X-Received: by 2002:a17:90a:e70f:b0:3b3:c8dc:a109 with SMTP id 98e67ed59e1d1-3b41c7abf75mr9733374a91.6.1795436208040;
        Mon, 23 Nov 2026 04:16:48 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([191.223.218.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm21112338a91.2.2026.11.23.04.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:16:47 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	akpm@linux-foundation.org,
	kay.sievers@vrfy.org,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH driver-core 1/1] kobject: reserve an envp slot for the terminator
Date: Mon, 23 Nov 2026 20:16:37 +0800
Message-ID: <cd35c5682ebe0f5a58fa6beed90bb7d0e7d5e9a2.1795426787.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795426787.git.caoruide123@gmail.com>
References: <cover.1795426787.git.caoruide123@gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ruide Cao <caoruide123@gmail.com>

add_uevent_var() currently allows envp_idx to reach ARRAY_SIZE(envp).
This fills the final pointer slot without leaving room for the NULL
terminator expected by usermode helper consumers.

A synthetic uevent can supply enough variables to make this happen.
When CONFIG_UEVENT_HELPER is enabled, kernel_execve() then scans beyond
the array while counting the environment and may dereference arbitrary
data as a string pointer.

Reserve the final slot so an environment is always terminated.

Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struct")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Ruide Cao <caoruide123@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>
---
 lib/kobject_uevent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index 1d29378d4f55..f7aa67d6ee54 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -673,7 +673,7 @@ int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
 	va_list args;
 	int len;
 
-	if (env->envp_idx >= ARRAY_SIZE(env->envp)) {
+	if (env->envp_idx >= ARRAY_SIZE(env->envp) - 1) {
 		WARN(1, KERN_ERR "add_uevent_var: too many keys\n");
 		return -ENOMEM;
 	}
-- 
2.47.3

