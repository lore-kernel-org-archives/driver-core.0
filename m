Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1D645D922;
	Fri, 11 Sep 2026 21:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160863; cv=none; b=WhKZmhpsEJOw4qQcKdksGhhvfeojS/HRyD+q01iby9sFA2I4abkdtPulb2mUoqE07BJXd212zMWpWMdkvKMQ3l9p6ti40pxvpwoFR5qR+YGXM9aqVMKNijqRCOm+HJq3MA+5AsLYvMgJvqcYBMt7goRX47Pa9CxcUVbFK1f+kRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160863; c=relaxed/simple;
	bh=EOyDqfU8lTK3pV/51zoUbmEcdA4KvKZdpNq309NubPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J9g/YGJX1HYS46T4xcgqN1Hd9b4K4YM+4JYUx+uYNtISzp0ncswBEdcLIqVHg9SFWocDSTmx/nrM6850R3yQXmaKHlNNUO01EHq0hidB4hAONbYeBsSi0FObcWlfLzyNq/JAdcw8Nf2M5NV/UOZav14+z/JddlyFdHd2/CVSzr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fk/w0Uge; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fk/w0Uge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2101F000FF;
	Fri, 11 Sep 2026 21:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789160861;
	bh=SQz9TLR7T7QDhRtItflaeMrfVdU4yvJWfBLrDVCCZcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fk/w0UgeXzDXIJB3E9aFoSb7y7s10LsIXPcdoIcl8g9iecsmgNAIMATsyK+yf2L5N
	 yyORQdqPPWgzPbv4pLzznen5PZSqu9q8zhPb7nXraTVKD/Ss28jYA1H1Bfo18ll67h
	 V11v/0rtlLcZLlfLgHAVDVwWTx+qtZMKLLs8pHEIhbut5wHb6mnFrKrnrDfFkdMyrR
	 EIjIBt67sKvCu5pfEK3OiGIc4S/+znrJ47IsWCOpep6weKzaQLg1vywC0ovwcgcKVt
	 wnYy4aMJciVCD23Pd9I9dKh8ZRFycY5locVDo0oRlxhV/RXqJkCX6zrdLp2p25MfHe
	 gmC6RspPmkkpg==
From: Danilo Krummrich <dakr@kernel.org>
To: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <iweiny@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
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
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: auxiliary: validate DeviceId name length
Date: Fri, 11 Sep 2026 23:07:33 +0200
Message-ID: <20260911210733.1547806-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910153844.3987791-1-georgeandrout13@gmail.com>
References: <20260910153844.3987791-1-georgeandrout13@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 11:38:44 -0400, Georgios Androutsopoulos wrote:
> [PATCH v2] rust: auxiliary: validate DeviceId name length

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: auxiliary: validate DeviceId name length
      commit: a4aaec5580d8

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
