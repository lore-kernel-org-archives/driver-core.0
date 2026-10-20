Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483965;
	b=P82xiFh4Sw0Lzvw3pYlan8U9sDGikEWANPNUYI8PfnoSgwxwJwB3r1h5uNF3//GsgG/d
	 6JYoWx9pMyI1sopYsd3x+ObmgYtGgz89xVMdJ+zciQEX/e1aAX6kB/EFxmDma3TsM41MY
	 cdcucQlE2nRKK0Y014tR12Qs6b1pA22GqldTzFNIBIlU9ynNHZS9fEzpZVeTLllBGd9B8
	 gLhx1k1AR4S/NxPr0QGLcfjtWm29+b8S/fUo86uiWipbEavBiX2DuAFDXCy+Q/LgQL11I
	 xZNyMu6UsNYjRRWlbh9AL0gAUIg15XJNN/W/iyUPFBY9Z00PN8WHfzlvdUqvY2e9RGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
	b=qSpkJD9vO1Wr7qGqeFsTXrOk1THjQ5ux2qq/0aMjMGxH9Hg6bGywRuuQDnHblbQ3uFXb
	 Ue1JS66VjRutIxakkwRMCzv9WuRKB6CTcEQ+t+KdNJqk1IAmY4hIgZseNQetjuqdQuiiN
	 y58XZFoF3CZjnkZc5S7BLcn2uhP14ASAv5eVcN1X4T6yx6Z3N4oGdicfh4v4g4kiMSVPT
	 Td/q3Jm/gjcohDkr5PjDyLjAhqEdKaMzEINHC2nM4bq8p+DcUCP+jCR3W+sTMUqGRYzCZ
	 bepf+U6/QYoSfkc04BYT8QssBMlQrpjXJBJ37YjawZN+TpnOkJC6OuEfAxS/XKEoH2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RhHjGVFr;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4879D606A322
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 08:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4879D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RhHjGVFr
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b1e4a24fe5so2678671a12.0
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483964; x=1793088764; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
        b=RhHjGVFrHamRSaFaJNw5KFB0KEDC92CCdOjPbhQiWnJCs4vvtLw4RdMzZ8zYu1oleq
         FJheYjrq5ZitJTwnGhMFJrUug9SCewCNEgnL/thLUnfOHElyBtBSvmERniqYDnSyJ+CU
         n25LMEkDlWViSBJPDffU4gDWLIZZBtybM9sdgd7BT69xvHh10mLUFWJMxjJ0CJu+U+cK
         wTLkyISd/eRfg666eslorld6dNhDUnoVyFrUwEAWei8aUXnr5nT3rcugDdG1aPjilC9J
         FDUPdJD2fGt3+XACPjTYVxGrCzhr3uzznItnub8JW5PbnbUBFQuihEdXm4mgl60NDxh8
         9tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483964; x=1793088764;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
        b=PJfj8PTkQrw04DFiN4Oa5p2L6RZ26vNwqzusiKl3pRo64RFfwIpbtd69T4U5msF0QE
         Y4ianUuf+Bou1ZoGOQ+t0bgOHDhyDVwNXICYxtno1Z8d6H7tIXz98Vy+kPdsOoN9FduK
         N3IufvrttaSeQg2GvNHTUGgmQ0l6hXFqSPVVv4Ui07a/Obu9b/WWaSw7b/KzaAOiyDRR
         S3FoPrPnDxNrpShi4ZwPALDiefEoNPLR1ZmeGMRT5fMOu+hHpcUqUpjOFaLlymmKueVg
         Cz/bqYHV9YXSbvT6hsd6RZU1MBhYb8vl1fLkEKUMGrYCC/4MSQfAvX5RPUdEd7DIHNBP
         5Qcg==
X-Forwarded-Encrypted: i=1; AKwUvBx0TdS76DDOJBAzvXEbbNWnuyjzoGgVthlWeKVDcfX300ObTnqitATdif4kADS6Uv4wvNLgzZrfyf7v5g==@lists.linux.dev
X-Gm-Message-State: AFq9FYL7NpRfz0B6vtuWi7E1DIeRiophlzGkJu8kD0XXMG5qKH/BdPCu
	QxqxbAm1DWnOr/AaJ7n32djH/3aolhbMNpwJbKMhDTcA2L2ZVugZMyJ42YMx2a6dEnolSry0QP3
	47Rv/fm1aTpCLJ34dlQ==
X-Received: from eduf17.prod.google.com ([2002:a05:6402:51:b0:6ac:c627:c778])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4344:b0:6b1:8818:1090 with SMTP id 4fb4d7f45d1cf-6b3a815d5admr6666189a12.22.1792483963442;
 Tue, 20 Oct 2026 01:12:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:12:34 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081236.1760816-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/3] rust: irq: declare cfi_encoding for irqreturn
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 11:34:37PM +0000, Sami Tolvanen wrote:
> The IRQ callbacks return c_uint. C calls them through irq_handler_t,
> which returns enum irqreturn. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
> 
> Generate irqreturn as a newtype with a cfi_encoding, as is done for
> lru_status, and return bindings::irqreturn_t from the callbacks.
> 
> Fixes: 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handlers")
> Fixes: 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Missing

	Cc: stable@vger.kernel.org

otherwise LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
