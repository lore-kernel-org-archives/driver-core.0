Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC78A37D118;
	Mon, 23 Mar 2026 21:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303014; cv=none; b=Hqe/lgyBe0kl0FqvMW9UIj2lBG3BXTzjHhndExVi5LJM4uDzPrH12Y7dbyu8UyPfjGbh1JYiuCIGB5wxVv3IRGYfK7WPypQMaI4Ap/YVXfIRjtgVZZMcD7xfHX8r+qSHdJSajg1R4VuiY8KwhAPty0xCB6vK14u4RMhzU4U+1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303014; c=relaxed/simple;
	bh=kI3bMJRdPfjTY4J1ka/g4c7ItdC1C2EpVS7Hjd+xIms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ERwOh98OXsvK5UxNnqqEJLig0df9PkbnLRBSeNpTyd5MAFQzLorVOi73nXwa91emgP89UBpE0raAVLipf2F/+TQ+3yw/1yAvDOxRCqtPWyNAruCsrWRAdz0QxidNwAglO9MJBgzhSjat1oJfT5qYC96wU7QeLjanQ2Z+q1oViv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1Z2F02g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1Z2F02g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A516BC4CEF7;
	Mon, 23 Mar 2026 21:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774303014;
	bh=kI3bMJRdPfjTY4J1ka/g4c7ItdC1C2EpVS7Hjd+xIms=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=l1Z2F02gyMyZJBFpQf9P9PihXMbmx1Y6+anjGj6bBrtHMyQb7tC/h29f3Cv20spBo
	 2RmTqi1HiT9eUWcS7k5cjlUKMYfCxr3Iu2A5vOjQ2ttJDGdrFSGfkLPtgSuwiitP8c
	 b4KMSqh9rhJ3FDv6qoKve4ZZmdPWx6aiv3jzqcxpm+8PY3Uw2CpFnP5c+s+XbURzmO
	 rbIgOsgY0BtqzvOk4vUgIwyaoEZ2wTwX/lCjJLdYAqa241FdPLO0cyRp7BeXv0FWpU
	 QA6cSN/tbG5ksPGOvkdJcqfJZYdW0/j6u1VTp4keB5Ch8sxhw9Ma2WK+Hah+iMZT9x
	 KqfvKf4MgtsTA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 22:56:48 +0100
Message-Id: <DHAHX9OTSGDZ.3YRZ455BB0J7@kernel.org>
Subject: Re: [PATCH v2 0/8] dma::Coherent & dma::CoherentBox API
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
To: <aliceryhl@google.com>, <acourbot@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
In-Reply-To: <20260320194626.36263-1-dakr@kernel.org>

On Fri Mar 20, 2026 at 8:45 PM CET, Danilo Krummrich wrote:

Applied to drm-rust-next, thanks!

> Danilo Krummrich (5):
>   rust: dma: use "kernel vertical" style for imports
>   rust: dma: introduce dma::CoherentBox for memory initialization

    [ Remove unnecessary trait bounds. - Danilo ]

>   rust: dma: add Coherent:init() and Coherent::init_with_attrs()
>   gpu: nova-core: use Coherent::init to initialize GspFwWprMeta
>   gpu: nova-core: convert Gsp::new() to use CoherentBox

    rust: dma: remove dma::CoherentAllocation<T>

> Gary Guo (3):
>   rust: dma: add generalized container for types other than slices
>   rust: dma: add zeroed constructor to `Coherent`

    [ Use kernel import style. - Danilo ]

>   gpu: nova-core: convert to new dma::Coherent API
