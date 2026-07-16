Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBDF318BA6;
	Thu, 16 Jul 2026 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784229482; cv=none; b=aZhlvejG4Xo4KADrBwZZASkK6NYhFLgTaoQsjiAB7tM78vps/XKaBDBcfGRDKGTK1QvakrCL0bPwMONxjSfAUED5cIFzh/X3FCfek2gPJDt26p0pVS4nGbhjZzf2Nw1Nc+3e+aYEqSqjc8UnIq7ShHe2R03U1dgbvU35EtjXtw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784229482; c=relaxed/simple;
	bh=rdpBWIMV0mkFxnrW+tr7JbtLUrwde/JBtGDABV8gXXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RWXUEyR+bGFjJ6wVkDtkEz07qZRtAGaCU/ip4IdZDz3Tr0xun5ou6s5oKa9S2iYj54zWK0Rf7tB2NapeF6E9piLGyfkheE1t21p9oHmB8FF7mozaRSyZzIOd6vzO/ega3Ue8sU9BtToSS6LVCHIQuyDJphYGmXdT27ZJ23VFMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYPIAFoX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYPIAFoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F168B1F000E9;
	Thu, 16 Jul 2026 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784229480;
	bh=v1ZsnC09DXNns+ZF1G8wN07cuqtedQlpR6ag18V8ZOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EYPIAFoX76cWNQLGl7MNByP3JopdojGF80lRG2vjWNGsgItD20FC1srSYzcRoTeoc
	 cBPlFuiKCx9+ubj2xm2bhWbUPbOS5aPcn5je6Qm7z7c0LAfLCwuRIhSTjpLbnBoON6
	 rHWuP+PWqxPiWTrYsqNd4NbCsvPyyI8lzSPv0l7J4jjSJJfat06IFYK2P2bBhJDJLU
	 n4RE5qDLmSMkwFcFdJSLLsgjfsId3MarIOeEhhLvUCKj5SgpxIC73biPfftgjYbdlR
	 SUoJyZCln5e4Q2ID5RE0EvYbJuFS6ssXyIEtzBj4R6mBCJHGI8u76YM9+GPHqipwgu
	 +R6dTgdFn3hyA==
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
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
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: firmware: avoid UB in example by passing parameter
Date: Thu, 16 Jul 2026 21:17:54 +0200
Message-ID: <20260716191754.3416419-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711180231.229525-1-ojeda@kernel.org>
References: <20260711180231.229525-1-ojeda@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 11 Jul 2026 20:02:31 +0200, Miguel Ojeda wrote:
> [PATCH] rust: firmware: avoid UB in example by passing parameter

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: firmware: avoid UB in example by passing parameter
      commit: c945c8f37a81

      [ Also drop the second superfluous empty line. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
