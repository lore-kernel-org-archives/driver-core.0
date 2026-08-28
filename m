Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4D2F8EAC
	for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 01:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881936; cv=none; b=M57xlCUjWwAaCIbbNuGw44B55Ar91YWJJJiNROjRbyws0OBidm9EmOG7ZYvrHfzEzrv3db9PZlpurhlnSMC++OjT+HKpRnAGUrUYjm3+rE82tCBrTgQk6X4FGntX6RrbaNTcHA4+Q9+nFHi72RAhjyI4m0UitZO4+erWUKkR5o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881936; c=relaxed/simple;
	bh=+5iO4dSAhEo3AZGC+XWiPNe2+jcuNGNmwtd8kiws88k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ea5EUztolfUo//T4UquIvCWk2ZZf9qONgJHs+g1qN3lm8Z27Bsznyp5lxGYEnIzRDT9GnyEB1CYS3SRoeBdkIPtulqGdEQ5Qf/6r0qF46ra+3bsOvSAU9B2X5pjR8YQ0+lKar3uyGblhgv6th+coE+YELtL0mUZZza0aPVfJ7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o20ABHXR; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o20ABHXR"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so410209a12.1
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 18:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881933; x=1788486733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNpC7rHp3pQpvORIwlLifm+Jt9USo4idXGhd8GPdBcU=;
        b=o20ABHXRImdolFneX17SNBDqpr+3wLc27kP2dJ/0cIxjrADv7fnjoLdYouCMS7PVq4
         akK0GFFqrkzC4ZHFK5kcbgEqnszhW1q7iyEKQo141nu3XSMpWDHU3J+7dJ2XIOa0hIMw
         OKf7KdMIH3pSh5JRZyJv4Lj3P8eQBEX5cN5lvpJ2bJGYkPuHcLqlD9/h3dbRcv8UGH7+
         PSSiBebl8umtAYTaH910Dv9UgZzmNTci2b3tdBPLh2nm7EDSo8/wY5VXQj9vVYYFWOfL
         gKXTCQjIyVGyMIThlJxu5RX4DrDe7rVQLd/kxxt1XceuUYILJkABaY0YFvr4DtJSXzWQ
         M/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881933; x=1788486733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNpC7rHp3pQpvORIwlLifm+Jt9USo4idXGhd8GPdBcU=;
        b=iUiH2owUh/KRu6I9hSj6WjeyqNU0nXPf+XnyDYvcXidG/buSt9PRS4JeHKgXth707v
         ERRgFSX0/zu9Vav+vkPRIK2wDI4+VhcyDY6qnJc5cdMfv83r1mf1XEslpj9jW37nAL+3
         MUFUZ4ywUJ33r86Ex+T7+iW3zsdXcg2mUwIrqJnQuWI7J+iMOVd7v7e/a1uDWewFI7hj
         rTbjRAneSco6NxSLqLjrx6fXdzQ7xJmkzhPIyUKVx62KjQ2QTOgfQEjemseI1fXlDLuD
         xliL4BhsxyGT39B7DA/mwTV7Bx4G1i1SYJFnmJ7qzgt76wFV5a2YC3Tdf2ptNctFabAo
         dIXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUpwaujuULDqfu41GroWlUuexjLZ1GogBI4vYayd3gOc/MrZjfOQ/PdXixI28XtqbBpGw2TP0tZGvLcw==@lists.linux.dev
X-Gm-Message-State: AFuF++lkSTeQZVE6ilbfbpmQc+veszAoPKcBjPtKEunZh+8q+HPUu0Qf
	4S0FPvPWEFkn61UIwiJANxW0EFARwBhDFSwymPqDmAmk2KHr0Ibj+nO3
X-Gm-Gg: AR+sD11ADaBC5cCXNZWetcRDbg1coZ5A1ZLvGTy+/XyPnm4jmGvgHYTvYYwKa6FzmdF
	3WyU5+32w4dmnN3fkkah4Yt32PnrrKjDj2ix2wBsGflEgxz0nCp4iLcU5ivPmsufPjpP1Tm9h/c
	40vB+uVFBAisJojiAOFv97HeRJPiJzB8DCg22BfkAtAOUoMAieR4R09MV5b4hP+W3CmZ+pDjTZs
	KeLN2ZI1U04sB53bA9ZUpxYlNtphAAQ7/Q6JjAVPR6hc0/EVSjSdZTbGzc2GYl1wRIqEaR4P6as
	PsYAX00wBmPQ1V4Vs+Q4IsdllGhLes8rGgSiPg/BxFO9FFAs8ciqXsshW+RYtv29mA3rBUp+7G4
	AaX1VNplUFSHGEtAhItf1ptbhnFT4H5uzreg6A5V49/MWHFkGDKKCK5Wif5+nSrcah1P6EogRR7
	HTBPUAHBOSOy1WpxImPK71lihIHcM9CFQoroKgJUccBVTqz/vGau0zTE5ezSiUZ/4T57w=
X-Received: by 2002:a17:90b:1d83:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-396d1023217mr5133053a91.14.1787881933040;
        Thu, 27 Aug 2026 18:52:13 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:12 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 0/3] rust: add missing newlines in printing calls
Date: Fri, 28 Aug 2026 04:50:19 +0300
Message-ID: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds missing trailing newlines (`\n`) in Rust `pr_*!`
and `dev_*!` calls across sample drivers and documentation examples.

Missing newlines cause kernel log lines to not be properly terminated,
leading to unexpected concatenation of consecutive log messages.

Mehmet Koseoglu (3):
  rust: samples: add missing newlines in rust_print_main
  dma-mapping: rust: samples: add missing newline in rust_dma
  rust: io: register: add missing newline in doc example

 rust/kernel/io/register.rs      | 2 +-
 samples/rust/rust_dma.rs        | 2 +-
 samples/rust/rust_print_main.rs | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.55.0

