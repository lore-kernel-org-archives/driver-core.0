Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366605;
	b=Hc+j2sQ0H4hEm9YijVXRVlZXnpZ35DjlvfC3FDO++s+rHffhTcKKcpzhLiA+teb/uVG4
	 VMlzZwHq0Ai2bt4QyOzVhXvVhnf8zhLKO0Cnfn5GVopCOPdip4NftIrfj8yMe3uThV2Xp
	 kQFQ63o0A/DZz/qxNte0zlmyyqrqbErP7AnG2eogWbN9t8R7u+jRCCPs85qCFURf4BINC
	 ZkhNVWTeZRMFoIdaRp2g+6hChCtKHBFkukYrg4t08TOX63E3TnipVyebvxqOS+bwakX8E
	 77K478qRe68mMy2CAaWZLcfZSTTPCAFaRSHJ5Kauj16vngeGOC5tiJKpvA1Ic3T282Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
	b=dz2MsptOg5h301uX4P+rVpkF3Z/yJ7YF+7bRnQtMuHMxvGfDv5VRdW2dGb4b53l++uQ7
	 ryZGVaEzXopJSrKulFMIBdJmNICDVX89iAaz85rHNBqT+M90mN6FxTgNNXjOv2MaPuvoK
	 9bB/q187lUzBSr8/82DeQ+xPvwFSRz2yAfqwDYC2CWqircuFnlkF9ooK8EWRWNf0p9mPN
	 wPqkVbc6FBuB3L+cnTPXF2VhTW/b9lPKMhz5lBmICF5EAbGVnNC3wlpMz4hR7GLt0ifGO
	 EHbmamogp3wElVQjMMgY0BNZrAEmwkvKIjt/LLx4/gxXpp5JfJYPtMeVdahNrPIaYgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KivbAfDZ;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66320606A32C
	for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 16:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66320606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KivbAfDZ
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-94965745d92so284058885a.2
        for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795366603; x=1795971403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
        b=KivbAfDZ4pXA0DzOnjmCtI9iAQZPlIqXQL6H+fpbbY7sUkoQKUNWXau3ozlh9Df7t7
         aXAsm0wQYQXb25VpMAMI7y9aUJoQMAAAGP492zto/sbIAZ+OwzcmKjCTekkZ6Y38aPzE
         xMyULO72KpDdrJr9cI/y+0HXl5eeXgKKzDsKxh82yZWfgHRjtbYGzMDlCk/B+NLfEjRA
         rKd7N8E6b9og3VFhbBWnqd1N6jGWIZjxLYEtUB/iqNRVMIcmy7qfW1ctLd8qI9O0Ta2s
         nTbk4clllGxNe3tschMN4YYRKb4l9kaLquPuDzluOCsM9HeWO2eFurWUhnkiyMY++QQY
         yy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795366603; x=1795971403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
        b=Gu8Nj9Wjg6s42I15vi3CXh2WFfSjs34A4W4t7wNJZha/cl/1rQmdXf4Hej5d3rZkpx
         iFoCa5DxaZTOcTN8rUg/oH4hFTV870uxljQkYndBs/61Ju+XBgMX8jZbTetAGZtoFQrl
         kuzfpGXftr63uP+vvBvg/WnOHv18R+9Wxhe3S2O4XnWbH+S8ESDWk6AHdAZEnkGHRADV
         ieON93zJPMwEfX+DC5AFI/pC2qGN5PrEhdnaIx7taDYgmh2arcp8cfYIPBykfdM88d+c
         6AcR1hZITkYS4naNYwVsGeAWuVtQeMeQnubtQaswsUsH6rw7y/fkQceiNhXrq++6YSTd
         /HFQ==
X-Forwarded-Encrypted: i=1; AL+hErE6wBRZ0Xk2SBrQ5+9q5WIEZO2K89lefgZLq1xHPs5Ygir053/hK/JewF636OIKgPdHflYBLMjW3CMg/Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9+wH7zTxngLXSpQh9n/q4lFY0PcYjGB6L9ZFrUwVFXCu0PMVRR
	IkRacQmU1Pm5AMfmt8Ib1G2ZqhhjYWttTntBHBakLi4jUlDL97rxzzJz
X-Gm-Gg: AZFdTZfdxYYBvJ/jlg1C1OlGst/J1XYlN54Mnj2bwNWB6wgzjwhL88Qb1U/tklkFNE/
	enNBgtypWjoTLivnZbcQGbQemD53vGOUWyUvXqb4NKimXOQf+jz7M+cwVSZgs6qINXVtSyy1zWJ
	Q63TfMaNQRC6HyQzK/9Mcqa8LbPfdnRFgrjHiZE/8Sy/xNuCelq4z6M4LfkEiH8m7tYW9frHPDG
	x5SfL3+qlOSzzBgjYoihJVAlY552A3kWATbt4oVOXAPT5XIftwcOjtm6L5yBIbf5NeAiBX6jtlh
	ZRUwyWfQDxG8dH0GZywUxDVc4ZR7vTYlVxFQgu/s6QEz4N+Go1vCqaOLjVHdK1GFsmP/NNPqD97
	a5w4qqnLkAfiUyY9JjkbpPILjeKPeesNl9cQp7EdhJT3Fshttzn1I/aOZ5RoMH+5YnxJd2UlX2q
	E6wLjfHemAvnPV/XJGfjgyG41c06nIrWy10k8Ow+PS2unEc5X3suzfTk5XvfD0nHkdcJbOgHH4S
	l5MlHeQahrSIM1m8KVJCRAtZZqXZFY/shsyimuUiM0Abrpiom1BFm7lA4nwaO1uMltW/wmr0Xt7
	tC8TpZKINIkCoaUZCdRZsnZTAWf/F3nfdJWsFTUYAjpEC9KN2Q==
X-Received: by 2002:a05:620a:6910:b0:944:12d5:fd45 with SMTP id af79cd13be357-949bab2a96bmr1590306385a.70.1795366603309;
        Sun, 22 Nov 2026 08:56:43 -0800 (PST)
Received: from tofu.taila6b446.ts.net ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm629367985a.7.2026.11.22.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:56:43 -0800 (PST)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: mcgrof@kernel.org,
	dakr@kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [RFC PATCH] rust: firmware: diagnose insufficient modinfo buffer capacity
Date: Sun, 22 Nov 2026 11:56:09 -0500
Message-ID: <20261122165609.1914670-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
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

`ModInfoBuilder::push_internal()` tracks the required length even when
the buffer is too small, but `push_module_name()` can still index past
its end. During const evaluation, this reports an out-of-bounds index
rather than the capacity constraint.

Check the capacity explicitly with `build_error!` so the failure
reports the violated constraint.

Link: https://github.com/Rust-for-Linux/linux/issues/1271
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/firmware.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index a18f8b84f3e3..54c6a13714c5 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -339,6 +339,10 @@ const fn push_module_name(self) -> Self {
             this = this.push_internal(module_name.to_bytes_with_nul());
 
             if N != 0 {
+                if this.n > N {
+                    crate::build_error!("Modinfo buffer too small for module name.");
+                }
+
                 // Re-use the space taken by the NULL terminator and swap it with the '.' separator.
                 this.buf[this.n - 1] = b'.';
             }

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

