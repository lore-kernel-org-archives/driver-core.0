Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFA32F7F09;
	Tue, 21 Jul 2026 00:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784592118; cv=none; b=oQi8CmpeXm0+ak9Xza/krEuIwQqvZ6fgijDT1Hn/DvDo8ymShuafrtL1BaAl76xNUIT//udbTihaKALrPq6sXCJFesaiX3Omhmyv2MN1w0TBK2/BBlwn1CG779OhifKN5a3yvJVZ+cBm8VQwHqLfnuQyxyU+vAcsrUMy5dNSK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784592118; c=relaxed/simple;
	bh=ImSnUdv3QX3WWof+f775LdiizDUkDkmVS4zYBS/6vBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCdBlKCGC0sVonW4+J2a292IKoQuIwgWnNhRXaMM3TNKfiL0SBX45wrRCpU7KHiEvubfGnh3Bg45zv9rwuu3qPpSKwo413QcjCtvuhmYV9Iee9+IsbYX8i8eaJwej4nWciGkqOD/SX7XpuQ0GpCKI+ILqBVdZqR091pCrtfeQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFVxil4V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFVxil4V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A982C1F00A3A;
	Tue, 21 Jul 2026 00:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784592115;
	bh=b9Xa5Ecl9k56JnA2xqLzAZ38s1Tfr7LuTdGmoDVYMNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UFVxil4Vu9G0ndnoa8WmNMZQe5wX8OZAweysLO7mcC5/ut/HHzSMVO6P3boetJVF6
	 PHnNBHTt7VymC3GW1lm9gQjcWt0tgL9laX+lMt97Xyj6YRT/TrBoj6LDZcuNKmGBvh
	 2Rl9gDyOY4qGA/6lvs1snHHMmnZhrSbYg6u+riLK02pqun0qZxaVI9kwdU30MvSbY8
	 AJO/n7uWFFuC9Y+khpqPlEu4CMoRvu/C62kIcJ4AVwTOTSNp/A3qVqy2HzgEUr1drf
	 vieGU/pyLm1WzBkx83XyJHoFqqa+nnk+G4yic4wDAU7B5/AGVULHs6VXeb2jKN01Id
	 Pa8AugaAx6KRg==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@kernel.org>
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
Subject: Re: (subset) [PATCH 1/2] rust: io: document const-offset requirement for infallible accessors
Date: Tue, 21 Jul 2026 02:01:48 +0200
Message-ID: <20260721000148.1304930-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716142545.3622278-1-gary@kernel.org>
References: <20260716142545.3622278-1-gary@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 16 Jul 2026 15:25:43 +0100, Gary Guo wrote:
> [PATCH 1/2] rust: io: document const-offset requirement for infallible accessors

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] rust: io: document const-offset requirement for infallible accessors
      commit: c2d8b262057c

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
