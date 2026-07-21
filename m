Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145AF37DEA9;
	Tue, 21 Jul 2026 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784592147; cv=none; b=EsTGASGlj78KPAjGx7QuaYg4kqCWMecbZ+dGwb5QNxMm0/Yt+PSCHBd0QvvIJD0Gsv5ZkiqoYbACbf4JJQA0wd5GHLdjniFNeAMBB/puzCDpC2XqaRiqJWVn24a5i36REjfTCKh8sQpccmN+s2S4T7tLoaUtM5dyPzhLmP69lUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784592147; c=relaxed/simple;
	bh=Gq6Jjc4U1/ffx72KIIhHQFAn7sgmyrPM+NfjCYIyYhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJtwaAz6CXf2jYlOo5e3wjqJogQIbMwHFSORBpmRL48SewzcQ9gnMHHD97FstCzrijA/yZXnn+at0o0K0v8vV0ICpDp+8ZcLufiShjET3qidifAij4UzUXMp+Eq9Uj/x2JtOPAawyK7mVBnj6fXrkTqgb7RyMAquQB9R1qrEh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAleiull; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAleiull"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1EC1F000E9;
	Tue, 21 Jul 2026 00:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784592143;
	bh=WO1siLOZ+LZETZMt5ibsvvYGQ1Ez+o9q54YwZ32Js8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OAleiull58LfRdBkfzd3s7qhbKngQBgpU8QAMLugHxPd87pG5dtbuE55nVdNMyfev
	 ij7tgx5m+24ac9DaUQloxyLAbkmhEiyoBighK09B/GgXCbqSjbXjOTjO4gJHUvQrII
	 pjg1HKLIvUd/PFVaA0+uP/iXjaX00WeF4Ow+Ndz7U/koiPR5L05umogT1J2EM9FuDk
	 6iZSzri5/G3+NbWGvfXYeHB7uq8HrWaOj4usfs3Av11C/bB7utbbrr8j+WLvSVY7T7
	 dBm/3Psaq88UbC0LjUyuqEBnP//dGO4clTuH0hddULGOQODE6DoIb6bFIjtS9yF/Xv
	 3MissVVkO0S7w==
From: Danilo Krummrich <dakr@kernel.org>
To: Younes Akhouayri <git@younes.io>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: irq: fix C header path in module docs
Date: Tue, 21 Jul 2026 02:02:18 +0200
Message-ID: <20260721000218.1305229-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717-docs-irq-rustdoc-header-v1-1-36749192aa04@younes.io>
References: <20260717-docs-irq-rustdoc-header-v1-1-36749192aa04@younes.io>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 17 Jul 2026 15:26:46 +0200, Younes Akhouayri wrote:
> [PATCH] rust: irq: fix C header path in module docs

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: irq: fix C header path in module docs
      commit: 01899cb7b924

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
