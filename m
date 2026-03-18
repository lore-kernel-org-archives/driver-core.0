Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D5125B2;
	Wed, 18 Mar 2026 00:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773792734; cv=none; b=O+ziy37jriR1rijS6Us7BVTX2qbS1O/JsaiKPZ3ZTXfsUIq+uW3dM+FyIna482a2tMZM/chvcPnLCgHnAtvP9hyKXVGSMp44SedIQQkzdgtLxJ8jsWxUV4xRS4QWkbAFKnLvbL8mpRQ73RS5/6tBLRp4DPcJhAw2IA5d/Z2f/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773792734; c=relaxed/simple;
	bh=CIHPlDS48++kIAWCCslJVrhBlxM5qZ4JacSLJu+KuHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cZZnXhU31mFqnLXiu2oyWX4aa74kgp7FM2e3UiKOqk7txduirURbZVzCIh5NbpGfJFRnG7tbC56Z5QAXJtlATpqmqoUUSv6fw+x01LWeEs9SpkfqwQMRm6pVuBHDs2elP44zTyAcLANvui9kQ865RokPNh9Nb71lh4MXLXREyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zlol6WR+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zlol6WR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECFEC4CEF7;
	Wed, 18 Mar 2026 00:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773792734;
	bh=CIHPlDS48++kIAWCCslJVrhBlxM5qZ4JacSLJu+KuHs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Zlol6WR+WOpVxmxopOsWMI4tqHdnljj/nPsJlm/CKCa3cYm6wW72uprq81SaDW2qd
	 I73lu776ZE5HIRC2ucAwe3sgssFyQ3qo8vtDLIn+sb6QxpGlCDsWyZAaaRusI01MJf
	 RTJS+UjFOHvw0JGPWaFhc08tbnmGKNU0ga4MoXtWnThg5DlH3OEXHXom8/XtkvXLwV
	 J2EUwF978BL6n90AUwnZrhuXrBB1NezHkO9U/YN3c9Ni2phm34oXtV4wnyZ0e1E17x
	 /m1f6Ig/9dRpejDUAjemCvW7IoP/VWUsuN00s3fGPS9fEbjwRxBF5Z/MjZL9+VVxbT
	 cym3uyAZhwO4Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 01:12:10 +0100
Message-Id: <DH5H1MYQZ0GO.WLQSV0JGRLJ4@kernel.org>
Subject: Re: [PATCH v2 0/5] Use struct devres_node in Devres<T>
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213220718.82835-1-dakr@kernel.org>
In-Reply-To: <20260213220718.82835-1-dakr@kernel.org>

On Fri Feb 13, 2026 at 11:07 PM CET, Danilo Krummrich wrote:

Applied to driver-core-testing, thanks!

> Danilo Krummrich (5):
>   devres: move struct devres_node into base.h
>   devres: export devres_node_init() and devres_node_add()
>   devres: add devres_node_remove()
>   devres: rename and export set_node_dbginfo()
>   rust: devres: embed struct devres_node directly

    [ * Improve comment about core::any::type_name(),
      * add #[must_use] to devres_node_remove(),
      * use container_of!() in devres_node_free_node().

        - Danilo ]
