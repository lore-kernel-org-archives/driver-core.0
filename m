Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C75E3EEAEE;
	Wed, 27 May 2026 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905102; cv=none; b=nvmCJYwVQbbGODksAVbUV5WCvlaoj5SJRvvgQmEe/gejgdi+n/qgGnuYEgSfR+eSIJRazsO4xanK+QjQErNNbKP3LboA2o5YFgp9yc32tDgkc/QRpCLLwGp7u9mq2MrsEzu5eEfWwp076XOGfiUSvxGeyGlJo4y2sofiEo99cLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905102; c=relaxed/simple;
	bh=pvEDXlT9St97YYbbPP3mamZYYjBrDXMRvejjl+fwV54=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Y/JzDv4XpTi0ty0s3eUXEqcRNl5wSF7JX9Gq/l5Fd6T58urXtLhqONtgGRWxJ3qMMHEugDuC27qvAzff3fzmy4wzCGkCT/xc7XMl7ps0pwK5MOH7VO58mlYYFyMR+KbKXBW6ZQb8BL5rZSBMXMEKZVE0y9+FX9F5TWORLiNGgOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwPMqUBU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwPMqUBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675071F000E9;
	Wed, 27 May 2026 18:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779905100;
	bh=pvEDXlT9St97YYbbPP3mamZYYjBrDXMRvejjl+fwV54=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=kwPMqUBUluhAy7+u+dBwShaPQljchylS65GnYxqsjsqIEES5Sdf64qPh9jAYkyAnv
	 nazMah5QIYxtotgBshzUMzTQ7WoM8GrBhX0sEtqUAXqmEjDb3EOmXc+rIZD3P8d/g8
	 UTotcr42JmWWV+9DCUoK/+LaWXSqA38Y26TQc6YeqZLoWC9qBuWVYI3JOE+/FcnO0R
	 M9pqqy0uNEYwaD6NtURT4hJ7UOS/r1AHy6igBqjxvn9w8JDI9g3Nj5SPlfYh9O5DAE
	 uDpnCU+x0E5xSuCPF8FUbiTXmhSVWTAAJY/9Awh/DXgOgCNGiBINBwb8qGXnmf8+O4
	 PjAlLen/HExfw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 20:04:56 +0200
Message-Id: <DITNP59XG4H8.VYHNILHQV05G@kernel.org>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260526000447.350558-1-dakr@kernel.org>
 <DITJFWVQH4ZF.1HYM0UDBMWQ2J@garyguo.net>
In-Reply-To: <DITJFWVQH4ZF.1HYM0UDBMWQ2J@garyguo.net>

On Wed May 27, 2026 at 4:44 PM CEST, Gary Guo wrote:
> On Tue May 26, 2026 at 1:04 AM BST, Danilo Krummrich wrote:
>> Add a 'static bound to prevent storing types with borrowed data in
>> Devres.
>
> The bound should be added on `Devres::new` instead.

I did consider this as it is generally recommended to minimize bounds on
structs.

However, a Devres<T> with non-'static T is semantically nonsensical, not ju=
st
unconstructible, and I think type level bound represents that better.
