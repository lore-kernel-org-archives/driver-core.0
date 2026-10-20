Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792493503;
	b=oV5l1dvvT9tUf4br3J0aBv1rb1JmidXB50DFR5+f/bIuyYIBelwLa3mA1YMnG38fahiX
	 y8YkHwvZPOHiyAYf4pAktAkqxMUS14JQ80eCrYchI2hSRXthvJZhsmB1pFqYVODnYmVDt
	 pOqvE7gy7KSthA1379YsV+Nwy6BjXSBA/jW8SpoVyVX6czHjg+IcM/3WLQfHm1eJeLZ5A
	 1SuTHHEyCIDpQwdKunue3r5C0INfX/QjvTwWNFSAGX/UGC88v4/9qoBZLS+Iluw6HOr+2
	 K3RsLWIvM8lqDBw0ZUCEHf9o3gNA8estfTiwoVAefnvAzDKFPKP2Hx7obpbBJpdTnvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
	b=JVloAyq7/7ENk+8Kp2SuQPIAaJuyhGjS80CEx8ddrq4caatpn32RvJyZL73mrrKzORyM
	 o1FbmpkcVCcVd5YltzSfma8zsNZopNY6pKEujuJoDhRuGCF3LMkkHKScx7Ymbnh4/fEcg
	 TG+pyV2gK+Yw9HT4i+axTucH0y6y3I8M5ebAB0Mm0gXyM2hx6Yk0lI6zWpo8Zu72SN1+4
	 mPzljzrwibYYBjOn3IVC0IzPr58J36MIe/FybodeyowOuZglC9cKtQ5A5V6baW81yEWIZ
	 UXBitA+NU25FTh08ptCqaJ18AG7mTn6KqvX2Db3U8v+DBInFNH/n3HYu8JPlJLgxugA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=stlLd1OQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C3560A380A
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 10:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C3560A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=stlLd1OQ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-34c522572bfso312420eec.3
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 03:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792493502; cv=none;
        d=google.com; s=arc-20260327;
        b=EJhTFknOeVuERESpc+Ob4tmrh/LGssnQzypfnsnVsxiO7YqStBswxZywCnD2jKP/WN
         ikJzNLPrqeQ8CuY38MJWS7lpBl84sDwpipum7vPADkeYex8axN/suRRPHVYG1XZk7yQe
         VK8Ja2Gl4kpxavVOwHOLAPDuWWxQoHYgSHAmI/62aJKMUDBVLXas18yRhUmuU+kb76Fg
         unb4geTgGT/Xbx3Puf3876BeBYcn722HuWGmSEvvjX7Ny7trvCiYgSx6D9E44Er8sctf
         nJfMDtzPmmKhP4CUjWJmGzf7Dx338+/suMvodk9a8ovYMxuyx858a358RYMfHHRDqoO0
         m24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        fh=THmFjCLqUvw6pNtbAZuGfTXYcF2+/RLVlhfFTFNK5h8=;
        b=nSHPWimhgWc53gEGp8a86oHQbvNssidEQ2+BCcWQKLu5Qjm1eF5ShpyHv/nPhmRlap
         M4yWaR9h79Sy5Gv7ShbzEugW3clUbcneqKtGAKyFL7ItoHUku469t4kP7ojgqebW9FiM
         gu8Z756bezN3eMLrx7GZkNrPuHwQHfaoUl5IJDEctnXQMUygE1/PkktGMC1lp/Ido8C0
         2hPljdSRUhDb/z5JUbiVSU1jBRADRXBkYbhJ42/YJ7Ks/uOdszDvKAwxM00s/C9y5/ZT
         6FlPM7GDvqaZUAnGUPznuewd+tqrqyqxy3yO8voGlhhyz5lWaiyJ6bQu0eQ2X1i+QKt7
         ueeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493502; x=1793098302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        b=stlLd1OQYaoxGBn7TDWPGQPEFcZWwKJSg0cgtYg753J0CJH29EqqA4kJv4E4pxc3Zb
         vD2HI3eGbg/0U7HgfcE/HpooOyOdHxyCYQ4OUtu4FRKunSvRdWgZY4towUJvYdkSAheU
         WS7k14u9GToXKYSf6Qd+BalmhHF0utfc6GYyBLUzGbyZG9FOoYhVI3LMoR2k+pg8UhdS
         Q3jZ/m1V/mFMLvltd15/LDX8qTGyg5lcbcSdf7DcBTsJ6sd3alsfTDccWmEiseCKpHEC
         kZW3N3NLZw2/eom0nV3p5pKsu6SSOQ1dcElCeKT2m4UmUj7ddb7le8K6uB4gZfnZGbbS
         j1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493502; x=1793098302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        b=adoaVZRIZkWSLUdfOl32NVZl38TWFqfEtLFRLBn7SSojcsks0dw+zkotX5mHsci3uA
         60I8dRJ0vNUVv9drKuARCfgwVbpa30BBb8yc9yNoGbw5aFyCIkdAHgNJGAka7gdLOSBI
         46YokNB0VePe2yfykd/CfJ9P1VnEIgcOeQ8E84U1pPIPfyiNMDJV4FeZo/1d+qUFrIVJ
         OFKlDenWNuP10AkvcAJS8ghDDcvy5uKYtcT28+S9HQVOFwMNFOoDrLMhqdY7P5nmta6W
         512wpDWCh+YoC7XnhGd5B3TQJKX3whuZTosZB7hn0Ker+XRylnLnOtjx29S1twH3n8yA
         yjyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCPF3M7YkdY/048m4eXFjUcEZ3AFVX4uH1rWgHUtqxFXun8h3SQ6tLCt/TDg9GOyAYpQH/9oCqu1VLwg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIg4gKa2qpKWIfCgE7Cb7YwmPOb5P3E2M3IqfBNETXXvEbqe52K
	Vi20/wSJzSurwyAUcVnAoHHdnhGKBvy5z86sBn2HNSMNXQ2RYXLZj1qmBP3m9xogQkleclFwd1R
	phNkemZ2jh42kQF3zxFdhXNq5jTWYwGo=
X-Gm-Gg: AYBFou0Jv9kakBnzLaMO2tY48N59Kji1eKQSpYr2okFFsS7NhWiq2Uzig14pH4yNMXW
	As/klvoUoaDR6mGBmZ5xKj2pBh/mzg/+BH89EtKTODPRRnUtoja+U3Dlhn9I90AQkm2hy3QAher
	xtaykJntrdotligaKJwqlhrFwDufhTLbo5cmLXIjTIjge6ipqRZMmndviX9Dl2JUtBsN0NKfxG/
	wFZWGero2tXtI6Eegy6irCKUnYIQLBKKG8CEG+B0kJA8+ByHWDbsK361U3dGaqv2JdQemoz2xcK
	l8GMe90vJSPXffKHqE06K+TbDyd01RBSs/wjmhyw+2cGNTawh1LByGf3y0jHvktgJoTCzGI/kWq
	A4LYWQza23VzlavY4mHvFeg8oySwprRQe4vdOa1oKFky7MWAHUnLYeMi2KBCuBnAokhMsYZy/wl
	JmglU4FX7mFf3I4vlsfFXeCee0Yb3kLNetREwP1e4mB7h8ktpUoPgfTtV2cP1csg==
X-Received: by 2002:a05:7301:4248:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-361a0f7f3famr22708825eec.2.1792493502390; Tue, 20 Oct 2026
 03:51:42 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:51:26 +0200
X-Gm-Features: AclHuK8l4G5GVvkCAmIWz2nvAGdMY2Kiu_VckZsjZRukFRtMb29mqFIXRr3hCgw
Message-ID: <CANiq72niEdx6XFtUA_aA0mxtBOpuCnCU1G78rnwivxUBVXrpfQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Fix CFI type mismatches
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> This series fixes a few CONFIG_CFI indirect call type mismatches that

I may pick these as fixes via `rust-fixes` if we get Acked-by's.

Thanks!

Cheers,
Miguel
