Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1835DA67;
	Tue, 21 Jul 2026 00:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784592134; cv=none; b=O6yjs5+diSVLZKxTBhih0Sbvc+zmUeRxp9VCjH5Nz0CEO4PWOgJV4J6fFozksS9mbARj1VuHzguOU04WWlWg1Hi1zIT4aJI6L5Aa7ngoRGT++uT1ynenZ8E3S2/KBiA7YfKtoyOf9977oRhVTFNiqaRBKDJ/LosBjK8soyMaGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784592134; c=relaxed/simple;
	bh=/KvQqOD9Amq5FxfAuPbmxAF/lZ81a9CDOjsRTgBz2JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e1zpVvQUYo1INIRufJX/kskqKYag59gtrdVRnufxZjS/H8Z7gSqV8rOg2AS4u0VsHT/uY/bnXta318WKVgPJxi1eqUb/hAuWDk2a4x+FJr429Fx/eRSp1XEwhu1zWW1sxs2w1xEG4Va6Gi3XTFQgYRosYaqKCnZ5p3NOYP0yvmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fafi9fsU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fafi9fsU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB141F000E9;
	Tue, 21 Jul 2026 00:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784592129;
	bh=qJvHi8PPh1tN1xfuipF1EQ2hoGJGmKL5yOJrDwuGnPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fafi9fsUn+2KGMVYlNdnWdcCLDj3/XWvLxme2pdJ+c8UCSLa3x5yHQtcEpmZAU4YH
	 yCvIptIstu2ag9oZcRlJpZ4SN/sB/teYaFHtyT4CQXQHn5ufCaC/o0Htal22w+ue6u
	 s+G2CAk2wOSF9dlvDGlvlw5MEZIzxcLPkywGKnjYfbBUsdInhCfQf4ZDASY4b+Priv
	 EEt/vz7ZoJk/JzyWUUARFKPi4jYTUlAiRFqp+5pBw8hXbvqQdy6IxovazMJiVrAfl/
	 Ysab0YAMb9X5B8scyE4cdRKV8CaShiyRs7LzUzfDWrbjx3iEOFX+SXtZWot/HvrMVN
	 wlm2Kzylm8gbA==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Matthew Maurer <mmaurer@google.com>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samples: rust: debugfs: fix excessive stack use
Date: Tue, 21 Jul 2026 02:02:02 +0200
Message-ID: <20260721000202.1305078-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716144144.3665719-1-gary@kernel.org>
References: <20260716144144.3665719-1-gary@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 16 Jul 2026 15:41:43 +0100, Gary Guo wrote:
> [PATCH] samples: rust: debugfs: fix excessive stack use

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] samples: rust: debugfs: fix excessive stack use
      commit: f5256ad60651

      [ Make the patch rustfmtcheck complient. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
