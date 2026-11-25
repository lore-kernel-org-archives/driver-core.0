Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596670;
	b=xZCnrX3Gx7oIvmV1lwBO0n2oyQBLfN20vGNeaYMLrvxEenAkMtrBvNRGXtK+D8Mh0lVI
	 /Wxdq5lT4PmPc/q+ZrP00BTgq6RaoAXldA0uaRA8WVEK8sGHjP7bM29wt03ImuNOs0bIf
	 fUyYF79eD+poBAGZ/fMAhDYgUCYZoPthbjd1KTiLYNhQjVd8ZXUeDZqBl3wd1LRt/upcU
	 0tME1KJ9msCV7IqHhLGgV6qm37PsxMaUuEcfd+k22Sak1EYITDZ1D1WCbD4oP/PVxr+X6
	 79ofr5j+kIMP1MQAmGuNFW0Kb57yTg5Dl5vTDpWsRijm0Yjy6ymXzQb6n6kq8xn21bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QAnCCnK2ZlhscigH/xJOagQpGqQrgNxkKqyWM53x5U8=;
	b=Gf3TzMFbWd5cSKKjIRflSX9WiLulGNa189vTGahUwu7SgJmBOZTXWOoFmJUrgDMtxDAP
	 7OE5RTHQGgM8rP3m0LfsPMv4v0o+1U3CxioVPkmgrEy8oHLCuagZRQ4lAWECBtFYvQTS3
	 PpUJCOPluqKdMhP1Uexos+lYWxKc0KctPxGtoFlkPaM5dBtmJv0FjZAOwgNkNpbaUkHPb
	 5U5FksRGvT72Zo49MRcz42KBqCSzsNKZmCJ4h+NAXve6rrxdlT8aifxNyNmVEq4qTMj6O
	 FKo2/PbNJaAEKi1z/EPBsV8pfmIQl/mUVMyoiMGa8Dud3NxcxYiB6dptc5NvuvTmfXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=DIRWzRNU;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D7606A323
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 08:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F9D7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=DIRWzRNU
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f07a960666so34345925ad.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 00:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795596670; x=1796201470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAnCCnK2ZlhscigH/xJOagQpGqQrgNxkKqyWM53x5U8=;
        b=DIRWzRNUc0oMkwwOA9oa9nbG1RCT4nyxeJ/xJ9qmRGrym5kumgUSPe0BHhuTaQ2Rjz
         qGCpSM8XR7v8S5zamnFLhDecMIRzQkLqqpLHitq9RFzAXiw/kJAnGfiwm/44OTG2ylNb
         lY/tAUK+NtAUwpCLUJi5aIIRZGbCA78mQuc2aF5zBdUT3IWV7MwLHdaAGKEO3ciqFyo5
         NJvmfFzAD380ip1v7aKpnWgN68E+eHSIWm1QWgy9LMZu+i0P3kM7nGZsEf67NA/Jpl65
         c53zM5GwyFFyfcVSF2TElqu9XDOBXnF4t04zbM+MBIUm76J8t0aKDEG3f0QCU624X85E
         MOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596670; x=1796201470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAnCCnK2ZlhscigH/xJOagQpGqQrgNxkKqyWM53x5U8=;
        b=V+te5vpQI1e/fPBu7X6K86Y/yCQ7WVAF13OVTKw1UZlBGQVEGS8PmvRGa2TlZlaSuU
         Ap9xJGs0aP31wnrJKTbI7aB4MD23yBWNB6l+TFko92pchKrQeLuVuXKZQfallntOOE8u
         +gPvdD2aAN2HW0JeN1GXridY9iWJJliQUEoSbOplEcOl49q6yROd4zFg3ZY3dOUOjr9q
         IhLH893kGKP6R00kNQtibbAvcxy09YHRUFFBYOIGa+M9/9yZnMB9yAfMEj4Aje8w6URs
         xVluvCX35snC4hL1rsK9VCOnB6d/v2QgAk71BZnK/EuqSgX71BRoeNfxBIUW1HPRqw6Z
         9sKg==
X-Gm-Message-State: APuU4Z8eWIgJrL8xVDh1sR5R6BHAPSOarZ/bgsdl1cg3W2LVPP8lvwVu
	faUeU8Twd9uCIrB4rk05kPxzzEt4hGLtuuixxsVLNCaNN9KMEplLYyhKGkCMRP1OQ7BSfTIlz4Z
	FGYPlN5zE3wP89Q==
X-Gm-Gg: AZFdTZc4q51GwxIHydc66FOOib92D9YLEZiNS7vb6wcDprikGmVbbXds0gOlhuNF6qv
	KtFoWyrh/vWTUAMYg9/DTKmVAy62Mih0mZDTeG+Mb6c6PanWyqnNkQhfbW863uQxKckAUvzKkbP
	T+xTbu9uAxClRuDCaMXYtqPdufZ25CifXkJaoR1UUcCPXjb/OwzGESxBGGMC8Rm45qTSFx6bt8T
	HMG7dEepDVfTtFsqVTb1k7C310DwLMIlbViHJ2RM0QPIA03DrpBV+cAclY8V2vm2gVVbT05ud2X
	XxhoyqdwMVs/nI0wTMCA+a3iDxbi2W5lHJyiHOaJ7/b1TxlKaOQRqjS8cq0JBwJw/QdgQ2g3Roi
	EioxZjC+Id5G1MhBU9osDnXsMnoYznajpjxdrARw6xMxq6faRnn/rbCx0/WXausTITzuLIYj2uZ
	gTIpFebkD541nndjbMAV7xP396LieP5etaKPIEtK8DRlN1QFTn7xTtFrPuNsFZzklgcoaGMffYI
	SnTh0loT3R87k0i8yYPIb6hIbgUMtXBjVCVfY4eB2MiC1XtKfaJzaGc1AL4KNVflqxvA+LtgfiO
	Giou4Kv1D1yQpa20qtj34Cc=
X-Received: by 2002:a17:903:b4b:b0:2df:991b:4368 with SMTP id d9443c01a7336-2f03f1817ddmr183305835ad.53.1795596669599;
        Wed, 25 Nov 2026 00:51:09 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([2a05:dfc1:8bc4:feda::14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee844acsm84491425ad.2.2026.11.25.00.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:51:09 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	akpm@linux-foundation.org,
	kay.sievers@vrfy.org,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH driver-core v2] kobject: terminate the uevent helper environment
Date: Wed, 25 Nov 2026 16:51:00 +0800
Message-ID: <39d1eae0d7c8b235f5d4b68d94205b70832ab786.1795506878.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
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

struct kobj_uevent_env has room for UEVENT_NUM_ENVP (64) environment
pointers and add_uevent_var() lets all of them be used. Once the last
slot is filled there is no room left for a NULL terminator.

The usermode helper path passes env->envp straight to
call_usermodehelper_setup(), and kernel_execve() expects a NULL
terminated array. A synthetic uevent written to a sysfs uevent file can
supply enough variables to fill all 64 slots. With CONFIG_UEVENT_HELPER
enabled and a helper configured, kernel_execve() then walks past the
array into envp_idx and buf, and dereferences that data as string
pointers.

Lowering the limit to 63 would avoid the overrun, but it would also
reduce the capacity available to every uevent, including the netlink
path that does not need a terminator, and could make existing callers
with many variables start failing.

Add a dedicated sentinel slot instead, keep the limit at
UEVENT_NUM_ENVP, and keep the array NULL terminated after a variable is
added and after zap_modalias_env() removes one.

Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struct")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Ruide Cao <caoruide123@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>
---
Changes in v2:
- Keep the capacity at 64 variables by adding a sentinel slot instead of
  lowering the add_uevent_var() limit, which would regress callers that
  emit many variables.
- Compare against UEVENT_NUM_ENVP explicitly.
- Keep envp[] NULL terminated after zap_modalias_env() removes MODALIAS.

v1: https://lore.kernel.org/all/cover.1795426787.git.caoruide123@gmail.com/
---
 include/linux/kobject.h | 2 +-
 lib/kobject_uevent.c    | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index 55e37a5d405e..f546f0f732e1 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -124,7 +124,7 @@ struct kobj_type {
 
 struct kobj_uevent_env {
 	char *argv[3];
-	char *envp[UEVENT_NUM_ENVP];
+	char *envp[UEVENT_NUM_ENVP + 1];
 	int envp_idx;
 	char buf[UEVENT_BUFFER_SIZE];
 	int buflen;
diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index 1d29378d4f55..25e388acc5ba 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -459,6 +459,7 @@ static void zap_modalias_env(struct kobj_uevent_env *env)
 		}
 
 		env->envp_idx--;
+		env->envp[env->envp_idx] = NULL;
 		env->buflen -= len;
 	}
 }
@@ -673,7 +674,7 @@ int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
 	va_list args;
 	int len;
 
-	if (env->envp_idx >= ARRAY_SIZE(env->envp)) {
+	if (env->envp_idx >= UEVENT_NUM_ENVP) {
 		WARN(1, KERN_ERR "add_uevent_var: too many keys\n");
 		return -ENOMEM;
 	}
@@ -690,6 +691,7 @@ int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
 	}
 
 	env->envp[env->envp_idx++] = &env->buf[env->buflen];
+	env->envp[env->envp_idx] = NULL;
 	env->buflen += len + 1;
 	return 0;
 }

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.47.3

