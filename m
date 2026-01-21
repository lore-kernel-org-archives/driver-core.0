Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E203833F39E;
	Wed, 21 Jan 2026 12:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997584; cv=none; b=fX4TJ6u8lMX3a1rWvItQsNVSSpYAPqS+lwkqc8syyLLovnGKo48BzyvOhXZo+d4oxdK17X0Azy81SnJtFCm1zx/QW65Kvs9VIxPxW0M51itmgPR/7ZMtjcZOuY9+gKh+SMwHNQ3pLxGDCfIR/3aiq180BS4tEN/KP2dE6sac6q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997584; c=relaxed/simple;
	bh=sZhXw1Ka7FZXsw9YXnlqOfuJZrmj+XzaMSThQxBmiHA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=k3oNQuUcJGaBRfuj5FzDYcOC35pUyini/jHqFek6jJ7xDx7Z9XkM5ynYXSb4FtezpSai9fKNevWiAtza/rzHwl0xJxCfKuWz9qHnUirXZ9vPI/OXky2oapFpMLWSd+L+RFsFTXWEikKVaZGxVEidaGrQMSfFjWcbOGyHn1B0JTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jt8dFe7V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jt8dFe7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519C3C116D0;
	Wed, 21 Jan 2026 12:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768997582;
	bh=sZhXw1Ka7FZXsw9YXnlqOfuJZrmj+XzaMSThQxBmiHA=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Jt8dFe7VW4P0bt1Kb96sn0otsDo8y4W1IY1pocGf7D42SDIT/wbIZzAsIteiY2+Bq
	 EHhcBM9iaKdA7EidOpjCWC91vyEHdpS/SJFTwBkWuELoN2SO2fqBLanaM0WlXU0JWU
	 LxDt6I0iyCq7F8Z+kcrqT4vH7uNzU1bsqg20B1zCrFme3HiBfq0oJrhQucOREfEbQ3
	 j0UfotRayXd79Zm14TTECnheyF1HfB0i4RrM6ud9WkynhGrHkObpA2s9JQr3V6CeN+
	 EeGZadXZsfiwjUXYYYoIbkF0TuHv7mjHor8cInUEycZWMgzbsHptRQmFacIEz9+Ara
	 WYJ+bLVVdB0FQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 13:12:59 +0100
Message-Id: <DFU9B135W94K.14PPD2NBXWYXB@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] driver core: faux: stop using static struct device
Cc: <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "Gui-Dong Han" <hanguidong02@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <2026012145-lapping-countless-ef81@gregkh>
In-Reply-To: <2026012145-lapping-countless-ef81@gregkh>

On Wed Jan 21, 2026 at 11:29 AM CET, Greg Kroah-Hartman wrote:
> faux_bus_root should not have been a static struct device, but rather a
> dynamically created structure so that lockdep and other testing tools do
> not trip over it (as well as being the right thing overall to do.)  Fix
> this up by making it properly dynamic.
>
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>

Closes: https://lore.kernel.org/lkml/CALbr=3DLYKJsj6cbrDLA07qioKhWJcRj+gW8=
=3Dbq5=3D4ZvpEe2c4Yg@mail.gmail.com/

> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
